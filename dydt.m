function [dy]=dydt(y,FB,FG,mG,cdp,mP,md,zd)
global g
if y(2) < zd
    mP1 = mP;
  else
    mP1 = mP - md;
  end
  dy = [(FB - FG) / (mP1 + mG) - mP1 * g / (mP1 + mG) - ...
                   cdp / (mP1 + mG) * y(1) ^ 2; y(1)];
end