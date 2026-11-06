$ErrorActionPreference = 'Stop'

Push-Location -LiteralPath $PSScriptRoot
try {
    $venvPython = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
    if (-not (Test-Path -LiteralPath $venvPython)) {
        if (Get-Command py -ErrorAction SilentlyContinue) {
            & py -3.11 -m venv .venv
        } else {
            & python -c "import sys; assert sys.version_info[:2] == (3, 11), 'Please install Python 3.11.'"
            if ($LASTEXITCODE -ne 0) { throw 'Python 3.11 is required.' }
            & python -m venv .venv
        }
        if ($LASTEXITCODE -ne 0) { throw 'Could not create the Python 3.11 environment.' }
    }

    & $venvPython -c "import sys; assert sys.version_info[:2] == (3, 11), 'The existing .venv must use Python 3.11.'"
    if ($LASTEXITCODE -ne 0) { throw 'The existing .venv must use Python 3.11.' }

    & $venvPython -m pip --disable-pip-version-check install -r requirements-lock.txt
    if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' }

    & $venvPython -m pip check
    if ($LASTEXITCODE -ne 0) { throw 'Dependency verification failed.' }

    # Update the kernel in place so reruns also work in OneDrive folders.
    $kernelSetup = @'
import json
import sys
from pathlib import Path
from ipykernel.kernelspec import get_kernel_dict

kernel_dir = Path(sys.prefix) / 'share' / 'jupyter' / 'kernels' / 'pps-t2'
kernel_dir.mkdir(parents=True, exist_ok=True)
spec = get_kernel_dict()
spec['display_name'] = 'Python (PPS_T2)'
(kernel_dir / 'kernel.json').write_text(json.dumps(spec, indent=2), encoding='utf-8')
'@
    & $venvPython -c $kernelSetup
    if ($LASTEXITCODE -ne 0) { throw 'Kernel registration failed.' }

    Write-Host 'Setup complete. Start JupyterLab with:'
    Write-Host '.\.venv\Scripts\python.exe -m jupyterlab'
} finally {
    Pop-Location
}
