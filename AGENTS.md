# Notebook workflow

- Keep `.ipynb` files as Jupyter notebooks and preserve the workspace association to `jupyter-notebook` in `.vscode/settings.json`.
- Preserve the Notebook editor while editing notebook files. If an IDE tool can control editors, open notebooks with `vscode.openWith` using the `jupyter-notebook` editor, or use `showNotebookDocument`. Do not explicitly open them with a text editor or a raw JSON diff.
- In final responses, mention notebook filenames as inline code without clickable file or line links. The installed Codex extension opens those links with `showTextDocument`, which switches to the JSON view regardless of the default editor association.
- When no IDE control tool is available, leave the editor selection alone and do not claim to have switched it. The default association and these instructions do not override the extension's own file-link or View changes behavior.
