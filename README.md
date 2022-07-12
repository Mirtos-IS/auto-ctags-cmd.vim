# auto-ctags-cmd
Run ctags on your project root from nvim asynchronously
![autoctatgs.vim](https://user-images.githubusercontent.com/85963720/178565159-ac180d01-853b-432f-9596-d227e4e82056.gif)

to set your project directory, change the variable
```vim
g:project_root = 'your_project'
```
you can also use full path, but only the folder name is enough

to use it, use the command
```vim
Ctags 
```

when using the command, it gonna run on your terminal `ctags -R 'project_root'`.

it accept you file directory that you want to run ctags recursively as an arguments. if non if given, it uses `g:project_root`


## License

MIT License
