{ config, pkgs, ... }: 
{
	# Oh My Posh - czyli uniwersalna konfiguracja motywow polowki
	programs = {
		oh-my-posh = {
			enable = true;
			enableFishIntegration = true;
			useTheme = "peru"; #atomic #peru #paradox
		};	
	};
}
