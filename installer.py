import os
import shutil

def install_nvim_config():
    source_dir = os.path.dirname(os.path.abspath(__file__))
    target_dir = os.path.expanduser("~/.config/nvim")
    
    if not os.path.exists(target_dir):
        os.makedirs(target_dir)
    
    for item in os.listdir(source_dir):
        source_path = os.path.join(source_dir, item)
        target_path = os.path.join(target_dir, item)
        
        if item in (os.path.basename(__file__), "README", "README.md", "README.txt"):
            continue
        
        if os.path.isdir(source_path):
            shutil.copytree(source_path, target_path, dirs_exist_ok=True)
        else:
            shutil.copy2(source_path, target_path)
    
    print(f"Neovim config installed to {target_dir}")

if __name__ == "__main__":
    install_nvim_config()
