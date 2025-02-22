pkgs:
{
	enable = true;
	defaultEditor = true;
	viAlias = true;	
	vimAlias = true;
	extraConfig = ''
	    set number
	    set relativenumber

	    set nobackup

	    set expandtab
	    set tabstop=2
	    set softtabstop=2
	    set shiftwidth=2
	    set autoindent
	    set smartindent

	    set nowrap
	    set scrolloff=8

	    silent! set belloff=all

	    syntax on
	    set list
	    set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
	'';
}
