function hst = LBP(X)

%Rotation-VARIANT lbp of the whole image.


%Returns LBP histogram (256 bins) of picture X.
%
%             1  2   4
% weights = 128  0   8
%            64 32  16
%
%the size of X must be at least 3x3 pixels


D = size(X);
sx = D(2);
sy = D(1);

Xi = zeros(sy+2,sx+2);
Xi(2:sy+1,2:sx+1) = X; %X+border

Xi1 = zeros(sy+2,sx+2);Xi2 = zeros(sy+2,sx+2);Xi3 = zeros(sy+2,sx+2);Xi4= zeros(sy+2,sx+2);
Xi5 = zeros(sy+2,sx+2);Xi6 = zeros(sy+2,sx+2);Xi7 = zeros(sy+2,sx+2);Xi8 = zeros(sy+2,sx+2);
%Xi_1...Xi_8 are matrices of size of X plus borders
Xi1(3:sy+2,3:sx+2) = X; % Vert:+1; Horiz:+1;
Xi2(3:sy+2,2:sx+1) = X; % Vert:+1; Horiz: 0;
Xi3(3:sy+2,1:sx) = X;   % Vert:+1; Horiz:-1;
Xi4(2:sy+1,1:sx) = X;   % Vert: 0; Horiz:-1;
Xi5(1:sy,1:sx) = X;     % Vert:-1; Horiz:-1;
Xi6(1:sy,2:sx+1) = X;   % Vert:-1; Horiz: 0;
Xi7(1:sy,3:sx+2) = X;   % Vert:-1; Horiz:+1;
Xi8(2:sy+1,3:sx+2) = X; % Vert: 0; Horiz:+1;

%Each pixel of Xi gonna contain the lbp of that pixel
Xi= (Xi1>=Xi)+2*(Xi2>=Xi)+4*(Xi3>=Xi)+8*(Xi4>=Xi)+16*(Xi5>=Xi)+32*(Xi6>=Xi)+64*(Xi7>=Xi)+128*(Xi8>=Xi);

X=Xi(3:sy,3:sx); % Cut the borders

hst=sum(hist(X,0:255)');

