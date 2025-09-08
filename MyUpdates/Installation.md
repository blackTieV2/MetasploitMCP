Recommended, you should **use a virtual environment to install Python packages** for non-system applications.

##Use a Python Virtual Environment

1. **Create a Virtual Environment**
   ```bash
   python3 -m venv MetasploitMCP
   ```
   - This creates a directory called `MetasploitMCP` with an isolated Python environment.

2. **Activate the Virtual Environment**
   ```bash
   source MetasploitMCP/bin/activate
   ```
   - Your shell prompt will change to indicate you are using the virtual environment.

3. **Install the Requirements (No sudo)**
   ```bash
   pip install -r requirements.txt
   ```

**Always use virtual environments for Python projects in modern Linux distros, especially Kali**. This method keeps your system safe from conflicts and package issues.
