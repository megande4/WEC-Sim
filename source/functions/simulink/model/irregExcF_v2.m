function forceExcitation = irregExcF_v2(A,w,fExtRE,fExtIM,phaseRand,dw,time,direction,spread,fExtMD)

%nfrequecyx ndirection x nDOF is how most variables come in
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
Fext = E1-E11; %1x6, though could be larger. fExtRE could include extra DOFs defined by the user

forceMeanDrift = squeeze(fExtMD(ii,:,:))*((A*spread(ii))*dw);
forceIMExcitation = squeeze(fExtIM(ii,:,:))*(sqrt((A*spread(ii))*dw));
forceREExcitation = squeeze(fExtRE(ii,:,:))* (sqrt((A*spread(ii))*dw));
forceExcitation = forceMeanDrift + forceIMExcitation +forceREExcitation; %nDOF x nfrequency x ndirection

end

%regression tets to test accuracy of an irregular wave, or just one of them
%to see how the outputs compare in accuracy. Not neccessarily worried about
%small differences in the function. 