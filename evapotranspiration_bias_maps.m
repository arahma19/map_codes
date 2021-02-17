clc;
Bias_OL=((sum(LAI(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);
Bias_GLASS_enkf=((sum(LAI_DA_GLASS_enkf(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);
Bias_SMAP_enkf=((sum(LAI_DA_SMAP_enkf(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);
Bias_JOINT_enkf=((sum(LAI_DA_JOINT_enkf(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);
Bias_GLASS_ensrf=((sum(LAI_DA_GLASS_ensrf(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);
Bias_SMAP_ensrf=((sum(LAI_DA_SMAP_ensrf(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);
Bias_JOINT_ensrf=((sum(LAI_DA_JOINT_ensrf(:,:,:)-resized_evapotranspiration_daily(:,:,:),3))/275)./s_re(:,:);

a=[-125.375:0.625:-67.0];
b=[53.0:-0.125:25.0];
path(path,genpath('C:\Users\arahma19\Desktop'));

h1=subplot_tight(2,3,1);

IM=imagesc(a,b,Bias_GLASS_enkf);
set (h1,'YDir','Normal');
% colormap (parula);
mycolormap=colormap(parula);
caxis ([-0.8 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(Bias_GLASS_enkf)) %%making the nan value white
% colorbar;
shading interp;
axis equal
set(h1,'ylim',[25.0 49.5]);
set(h1,'xlim',[-125.0 -67.0]);
set(h1,'Fontsize',10);
% set(h1,'xtick',-120:10:-70,'xticklabel',[]);
% set(gca,'ytick',30:5:45,'yticklabel',[]);
ylabel ('Evapotranspiration(kg/m^2s^-1)','Fontsize',12);
title ('GLASS DA Enkf','Fontsize',14);
hold on
borders('countries','k','Linewidth',2)%%%creating border; need to load border data for that 
% set(h1, 'Position', [-0.1,0.7, .8, .2]); %% [xLeft, yBottom, width, height]

h2=subplot_tight(2,3,2);

IM=imagesc(a,b,Bias_SMAP_enkf);
set (h2,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([-0.8 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(Bias_SMAP_enkf)) %%making the nan value white
% colorbar;
shading interp;
axis equal
set(h2,'ylim',[25.0 49.5]);
set(h2,'xlim',[-125.0 -67.0]);
set(h2,'Fontsize',10);
% set(h1,'xtick',-120:10:-70,'xticklabel',[]);
% set(gca,'ytick',30:5:45,'yticklabel',[]);
% ylabel ('Evapotranspiration','Fontsize',12);
title ('SMAP DA Enkf','Fontsize',14);
hold on
borders('countries','k','Linewidth',2)%%%creating border; need to load border data for that 
% set(h1, 'Position', [-0.1,0.7, .8, .2]); %% [xLeft, yBottom, width, height]

h3=subplot_tight(2,3,3);

IM=imagesc(a,b,Bias_JOINT_enkf);
set (h3,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([-0.8 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(Bias_JOINT_enkf)) %%making the nan value white
% colorbar;
shading interp;
axis equal
set(h3,'ylim',[25.0 49.5]);
set(h3,'xlim',[-125.0 -67.0]);
set(h3,'Fontsize',10);
% set(h1,'xtick',-120:10:-70,'xticklabel',[]);
% set(gca,'ytick',30:5:45,'yticklabel',[]);
% ylabel ('Evapotranspiration','Fontsize',12);
title ('SMAP DA Enkf','Fontsize',14);

hold on
borders('countries','k','Linewidth',2)%%%creating border; need to load border data for that 
% set(h1, 'Position', [-0.1,0.7, .8, .2]); %% [xLeft, yBottom, width, height]

h4=subplot_tight(2,3,4);
IM=imagesc(a,b,Bias_GLASS_ensrf);
set (h4,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([-0.8 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(Bias_GLASS_ensrf)) %%making the nan value white
% colorbar;
shading interp;
axis equal
set(h4,'ylim',[25.0 49.5]);
set(h4,'xlim',[-125.0 -67.0]);
set(h4,'Fontsize',10);
% set(h1,'xtick',-120:10:-70,'xticklabel',[]);
% set(gca,'ytick',30:5:45,'yticklabel',[]);
ylabel ('Evapotranspiration(kg/m^2s^-1)','Fontsize',12);
title ('GLASS DA Ensrf','Fontsize',14);
hold on
borders('countries','k','Linewidth',2)%%%creating border; need to load border data for that 
% set(h1, 'Position', [-0.1,0.7, .8, .2]); %% [xLeft, yBottom, width, height]

h5=subplot_tight(2,3,5);
IM=imagesc(a,b,Bias_SMAP_ensrf);
set (h5,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([-0.8 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(Bias_SMAP_ensrf)) %%making the nan value white
% colorbar;
shading interp;
axis equal
set(h5,'ylim',[25.0 49.5]);
set(h5,'xlim',[-125.0 -67.0]);
set(h5,'Fontsize',10);
% set(h1,'xtick',-120:10:-70,'xticklabel',[]);
% set(gca,'ytick',30:5:45,'yticklabel',[]);
% ylabel ('Evapotranspiration','Fontsize',12);
title ('SMAP DA Ensrf','Fontsize',14);
hold on
borders('countries','k','Linewidth',2)%%%creating border; need to load border data for that 
% set(h1, 'Position', [-0.1,0.7, .8, .2]); %% [xLeft, yBottom, width, height]

h6=subplot_tight(2,3,6);
IM=imagesc(a,b,Bias_JOINT_ensrf);
set (h6,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([-0.8 0.8]);
% mycolormap=colormap(darkb2r(0,1)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(Bias_JOINT_ensrf)) %%making the nan value white
% colorbar;
shading interp;
axis equal
set(h6,'ylim',[25.0 49.5]);
set(h6,'xlim',[-125.0 -67.0]);
set(h6,'Fontsize',10);
% set(h1,'xtick',-120:10:-70,'xticklabel',[]);
% set(gca,'ytick',30:5:45,'yticklabel',[]);
% ylabel ('Evapotranspiration','Fontsize',12);
title ('JOINT DA Ensrf','Fontsize',14);
hold on
borders('countries','k','Linewidth',2)%%%creating border; need to load border data for that 
% set(h1, 'Position', [-0.1,0.7, .8, .2]); %% [xLeft, yBottom, width, height]
% hp4 = get(subplot(1,3,3),'Position')
colorbar('Position', [hp4(2)+hp4(4)+0.04 hp4(2)*2.5  0.012  hp4(1)*0.6]);