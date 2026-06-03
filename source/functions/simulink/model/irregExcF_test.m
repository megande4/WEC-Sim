
%testing outputs of the refactored irregular excitation function and old function

A = waves.amplitude; %500x1
w = waves.omega; %500x1
spread = waves.spread; %1x3
fExctRE = body(1,1).hydroForce.hf1.fExt.re; %3x500x6
fExctIM = body(1,1).hydroForce.hf1.fExt.im; %3x500x6
fExctMD = body(1,1).hydroForce.hf1.fExt.md; %3x500x6
direction = waves.direction; %1x3
phaseRand = waves.phase; %500x3
dw = waves.dOmega; %500x1
time = simu.time; %1x4001


ii = 1:length(direction);
B1 = sin((w*time+pi/2)+phaseRand(:,ii));
B11 = sin((w*time)+phaseRand(:,ii));
C0 =(A*spread(ii))*dw;
C1 = sqrt((A*spread(ii))*dw);
D0 = squeeze(fExtMD(ii,:,:))*((A*spread(ii))*dw); %mean drift force
D1 = squeeze(fExtRE(ii,:,:))*sqrt((A*spread(ii))*dw);
D11 = squeeze(fExtIM(ii,:,:))*sqrt((A*spread(ii))*dw);
E1 = (squeeze(fExtMD(ii,:,:))*((A*spread(ii))*dw)) + ((sin((w*time+pi/2)+phaseRand(:,ii)))*(squeeze(fExtRE(ii,:,:))*sqrt((A*spread(ii))*dw)));
E11 = (squeeze(fExtMD(ii,:,:))*((A*spread(ii))*dw)) + (sin((w*time)+phaseRand(:,ii)))*(squeeze(fExtIM(ii,:,:))*sqrt((A*spread(ii))*dw));
Fext = E1-E11;

%Fext = irrefExcF_v2(A,w,fExtRE,fExtIM,phaseRand,dw,time,direction,spread,fExtMD);
%Fex_old = irregExcF(A,w,fExtRE,fExtIM,phaseRand,dw,time,direction,spread,fExtMD);


