clc;

D_OL = 'C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_122323020_enkf\OL\SURFACEMODEL\2015*\';
ncl=dir([D_OL '\LIS_HIST*nc']);

D_DA_GLASS_enkf= 'C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_122323020_enkf\GLASS_DA\SURFACEMODEL\2015*\';
ncl_DA_GLASS_enkf=dir([D_DA_GLASS_enkf '\LIS_HIST*nc']);

D_DA_SMAP_enkf='C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_122323020_enkf\SMAP_DA\SURFACEMODEL\2015*\';
ncl_DA_SMAP_enkf=dir([D_DA_SMAP_enkf '\LIS_HIST*nc']);

D_DA_JOINT_enkf= 'C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_122323020_enkf\JOINT_DA\SURFACEMODEL\2015*\';
ncl_DA_JOINT_enkf=dir([D_DA_JOINT_enkf '\LIS_HIST*.d01.nc']);

D_DA_GLASS_ensrf= 'C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_01262021_ensrf\GLASS_DA\SURFACEMODEL\2015*\';
ncl_DA_GLASS_ensrf=dir([D_DA_GLASS_ensrf '\LIS_HIST*nc']);

D_DA_SMAP_ensrf='C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_01262021_ensrf\SMAP_DA\SURFACEMODEL\2015*\';
ncl_DA_SMAP_ensrf=dir([D_DA_SMAP_ensrf '\LIS_HIST*nc']);

D_DA_JOINT_ensrf= 'C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\output_CONUS_01262021_ensrf\JOINT_DA\SURFACEMODEL\2015*\';
ncl_DA_JOINT_ensrf=dir([D_DA_JOINT_ensrf '\LIS_HIST*.d01.nc']);

for k=1:length(ncl)
  
    LAI_OL(:,:,k)= ncread([ncl(k).folder '\' ncl(k).name],'Evap_tavg');           
%     LAI(:,:)=rot90(nanmean(LAI_OL,3));
    LAI(:,:,k)=rot90(LAI_OL(:,:,k));
    
    LAI_DA_SMAP_1_enkf(:,:,k,:)= ncread([ncl_DA_SMAP_enkf(k).folder '\' ncl_DA_SMAP_enkf(k).name],'Evap_tavg');           
    LAI_DA_SMAP_2_enkf(:,:,k,:)=rot90(LAI_DA_SMAP_1_enkf(:,:,k,:));
    LAI_DA_SMAP_enkf(:,:,k)=nanmean(LAI_DA_SMAP_2_enkf(:,:,k,:),4); 
    
    LAI_DA_GLASS_1_enkf(:,:,k,:)= ncread([ncl_DA_GLASS_enkf(k).folder '\' ncl_DA_GLASS_enkf(k).name],'Evap_tavg');           
    LAI_DA_GLASS_2_enkf(:,:,k,:)=rot90(LAI_DA_GLASS_1_enkf(:,:,k,:));
    LAI_DA_GLASS_enkf(:,:,k)=nanmean(LAI_DA_GLASS_2_enkf(:,:,k,:),4); 

    LAI_DA_JOINT_1_enkf(:,:,k,:)= ncread([ncl_DA_JOINT_enkf(k).folder '\' ncl_DA_JOINT_enkf(k).name],'Evap_tavg');           
    LAI_DA_JOINT_2_enkf(:,:,k,:)=rot90(LAI_DA_JOINT_1_enkf(:,:,k,:));
    LAI_DA_JOINT_enkf(:,:,k)=nanmean(LAI_DA_JOINT_2_enkf(:,:,k,:),4); 
    
    LAI_DA_SMAP_1_ensrf(:,:,k,:)= ncread([ncl_DA_SMAP_ensrf(k).folder '\' ncl_DA_SMAP_ensrf(k).name],'Evap_tavg');           
    LAI_DA_SMAP_2_ensrf(:,:,k,:)=rot90(LAI_DA_SMAP_1_ensrf(:,:,k,:));
    LAI_DA_SMAP_ensrf(:,:,k)=nanmean(LAI_DA_SMAP_2_ensrf(:,:,k,:),4); 
    
    LAI_DA_GLASS_1_ensrf(:,:,k,:)= ncread([ncl_DA_GLASS_ensrf(k).folder '\' ncl_DA_GLASS_ensrf(k).name],'Evap_tavg');           
    LAI_DA_GLASS_2_ensrf(:,:,k,:)=rot90(LAI_DA_GLASS_1_ensrf(:,:,k,:));
    LAI_DA_GLASS_ensrf(:,:,k)=nanmean(LAI_DA_GLASS_2_ensrf(:,:,k,:),4); 

    LAI_DA_JOINT_1_ensrf(:,:,k,:)= ncread([ncl_DA_JOINT_ensrf(k).folder '\' ncl_DA_JOINT_ensrf(k).name],'Evap_tavg');           
    LAI_DA_JOINT_2_ensrf(:,:,k,:)=rot90(LAI_DA_JOINT_1_ensrf(:,:,k,:));
    LAI_DA_JOINT_ensrf(:,:,k)=nanmean(LAI_DA_JOINT_2_ensrf(:,:,k,:),4); 
        
end

file_transp="C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\GLEAM_data\v3.3b\daily\2015\Et_2015_GLEAM_v3.3b.nc";
transp=ncread(file_transp,'Et');
% ncdisp (file_GLEAM);
file_evap="C:\Users\arahma19\OneDrive - George Mason University\paper 3_joint Assimilation\GLEAM_data\v3.3b\daily\2015\E_2015_GLEAM_v3.3b.nc";
evap=ncread(file_evap,'E');

x=1:1:1400;
y=720:-1:1;

x_index=x>=218 & x<=452;
y_index=y>=460 & y<=572;
z=1:1:365;
z_index=z>90;
transp_data_subset_1(:,:,:)=transp(y_index,x_index,z_index);
%data_subset_2(:,:)=nanmean(data_subset_1,3);
evap_data_subset_1(:,:,:)=evap(y_index,x_index,z_index);


evapotranspiration_subset_1(:,:,:)=(evap_data_subset_1+transp_data_subset_1)/(3600*24);
s=nanmean(evapotranspiration_subset_1,3);
evapotranspiration_subset_1(isnan(evapotranspiration_subset_1))=0;
resized_evapotranspiration_daily(:,:,:)=imresize(evapotranspiration_subset_1,[57,94],'nearest');
resized_evapotranspiration_daily(resized_evapotranspiration_daily==0)=NaN;
% resized_evap=nanmean(resized_evapotranspiration_daily,3);
s(isnan(s))=0;
s_re=imresize(s,[57,94],'nearest');
s_re(s_re==0)=NaN;
%ststistical analysis of GLEAM data and model analysis
mean_OL=nanmean(LAI,3);
mean_GLASS_enkf=nanmean(LAI_DA_GLASS_enkf,3);
mean_SMAP_enkf=nanmean(LAI_DA_SMAP_enkf,3);
mean_JOINT_enkf=nanmean(LAI_DA_JOINT_enkf,3);
mean_GLASS_ensrf=nanmean(LAI_DA_GLASS_ensrf,3);
mean_SMAP_ensrf=nanmean(LAI_DA_SMAP_ensrf,3);
mean_JOINT_ensrf=nanmean(LAI_DA_JOINT_ensrf,3);
NubRMSE_OL(:,:)=(sqrt(sum((((LAI(:,:,:)-mean_OL(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
NubRMSE_GLASS_enkf(:,:)=(sqrt(sum((((LAI_DA_GLASS_enkf(:,:,:)-mean_GLASS_enkf(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
NubRMSE_SMAP_enkf(:,:)=(sqrt(sum((((LAI_DA_SMAP_enkf(:,:,:)-mean_SMAP_enkf(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
NubRMSE_JOINT_enkf(:,:)=(sqrt(sum((((LAI_DA_JOINT_enkf(:,:,:)-mean_JOINT_enkf(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
NubRMSE_GLASS_ensrf(:,:)=(sqrt(sum((((LAI_DA_GLASS_ensrf(:,:,:)-mean_GLASS_ensrf(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
NubRMSE_SMAP_ensrf(:,:)=(sqrt(sum((((LAI_DA_SMAP_ensrf(:,:,:)-mean_SMAP_ensrf(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
NubRMSE_JOINT_ensrf(:,:)=(sqrt(sum((((LAI_DA_JOINT_ensrf(:,:,:)-mean_JOINT_ensrf(:,:))-(resized_evapotranspiration_daily(:,:,:)-s_re(:,:))).^2),3)/275))./s_re(:,:);
diff_GLASS_enkf(:,:)=NubRMSE_OL(:,:)-NubRMSE_GLASS_enkf(:,:);
diff_SMAP_enkf(:,:)=NubRMSE_OL(:,:)-NubRMSE_SMAP_enkf(:,:);
diff_JOINT_enkf(:,:)=NubRMSE_OL(:,:)-NubRMSE_JOINT_enkf(:,:);
diff_GLASS_ensrf(:,:)=NubRMSE_OL(:,:)-NubRMSE_GLASS_ensrf(:,:);
diff_SMAP_ensrf(:,:)=NubRMSE_OL(:,:)-NubRMSE_SMAP_ensrf(:,:);
diff_JOINT_ensrf(:,:)=NubRMSE_OL(:,:)-NubRMSE_JOINT_ensrf(:,:);

NubRMSE_value_OL=nanmean(nanmean(NubRMSE_OL,1),2);
NubRMSE_value_GLASS_enkf=nanmean(nanmean(NubRMSE_GLASS_enkf,1),2);
NubRMSE_value_SMAP_enkf=nanmean(nanmean(NubRMSE_SMAP_enkf,1),2);
NubRMSE_value_JOINT_enkf=nanmean(nanmean(NubRMSE_JOINT_enkf,1),2);
NubRMSE_value_GLASS_ensrf=nanmean(nanmean(NubRMSE_GLASS_ensrf,1),2);
NubRMSE_value_SMAP_ensrf=nanmean(nanmean(NubRMSE_SMAP_ensrf,1),2);
NubRMSE_value_JOINT_ensrf=nanmean(nanmean(NubRMSE_JOINT_ensrf,1),2);

[M,I]=max(diff_JOINT_ensrf(:));
[I_row,I_col]=ind2sub(size(diff_JOINT_ensrf),I);


a=[-125.375:0.625:-67.0];
b=[53.0:-0.125:25.0];
path(path,genpath('C:\Users\arahma19\Desktop'));

h1=subplot_tight(2,3,1);

IM=imagesc(a,b,NubRMSE_GLASS_enkf);
set (h1,'YDir','Normal');
% colormap (parula);
mycolormap=colormap(parula);
caxis ([0 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(NubRMSE_GLASS_enkf)) %%making the nan value white
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

IM=imagesc(a,b,NubRMSE_SMAP_enkf);
set (h2,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([0 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(NubRMSE_SMAP_enkf)) %%making the nan value white
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

IM=imagesc(a,b,NubRMSE_JOINT_enkf);
set (h3,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([0 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(NubRMSE_JOINT_enkf)) %%making the nan value white
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
IM=imagesc(a,b,NubRMSE_GLASS_ensrf);
set (h4,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([0 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(NubRMSE_GLASS_ensrf)) %%making the nan value white
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
IM=imagesc(a,b,NubRMSE_SMAP_ensrf);
set (h5,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([0 0.8]);
% mycolormap=colormap(darkb2r(-0.01,0.01)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(NubRMSE_SMAP_ensrf)) %%making the nan value white
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
IM=imagesc(a,b,NubRMSE_JOINT_ensrf);
set (h6,'YDir','Normal');
mycolormap=colormap(parula);
caxis ([0 0.8]);
% mycolormap=colormap(darkb2r(0,1)); %%positive red and negative value blue,zero value white
colormap(flipud(mycolormap));
% c = colorbar('Ticks',[-0.5:0.1:0.5],'YColor',[0 0 0]);
% set(gca,'color','w');
set(IM,'AlphaData',~isnan(NubRMSE_JOINT_ensrf)) %%making the nan value white
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