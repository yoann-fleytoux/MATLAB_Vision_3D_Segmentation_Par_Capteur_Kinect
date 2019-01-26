% clear all;
% close all;

load('roiX.mat');
load('roiY.mat');
load('roiZ.mat');

% % On regarde si le r�sultat convient
figure();
plot3(roiX,roiY,roiZ,'.');
xlabel('X'); ylabel('Y'), zlabel('Z');
box on;

% **********************************************************************
% Partie 2.2-3 : Triangulation de Delaunay
%   On utilise la m�thode de Delaunay pour organiser les points en
%   triangles, afin de r�cup�rer les diff�rents plans
%   ******* A compl�ter ******* %

TRI = delaunay(roiX,roiY);
trisurf(TRI,roiX,roiY, zeros(size(roiX)));

% **********************************************************************
% Partie 2.2-4 : Tableau d'accumulations (azimuth et élévation)
%   ******* A compl�ter ******* %

N = [];

A = [roiX(TRI(:,1))',roiY(TRI(:,1))',roiZ(TRI(:,1))'];
B = [roiX(TRI(:,2))',roiY(TRI(:,2))',roiZ(TRI(:,2))'];
C = [roiX(TRI(:,3))',roiY(TRI(:,3))',roiZ(TRI(:,3))'];

AB = B-A;
BC = C-B;
for i=1:size(A(:,1))
    n = cross(AB(i,:),BC(i,:));
    N = [N,n'/norm(n)];
end
N = N';
azimut = [];
elevation = [];
for i=1:size(N(:,1))
    azimut = [azimut atan2(N(i,1)',N(i,2)')];
    elevation = [elevation atan2(N(i,3),sqrt(N(i,1).^2 + N(i,2).^2))];
end

% Affichage de l'histogramme
%   ******* A compl�ter ******* %

hist(elevation);

% **********************************************************************
% Partie 2.2-5 :    Rotation de la sc�ne pour r�cup�rer les points � la surface
% de l'objet
%   ******* A compl�ter ******* %

% On r�cup�re l'orientation des normales gr�ce � un histogramme cumul�



% Calcul de la matrice de rotation



% Affichage du r�sultat de la rotation



% Seuillage entre les points du sol et la surface de l'objet



% Affichage du r�sultat



% Si le r�sultat est correct, on sauvegarde les donn�es s�lectionn�es
% save('modele.mat','modele');

