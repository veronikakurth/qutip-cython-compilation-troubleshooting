# Example that forces string compilation
import qutip
from qutip import sigmax, mesolve
import numpy as np
import sysconfig, sys, os

qutip.settings.debug = True

H = sigmax()
psi0 = qutip.basis(2, 0)
tlist = np.linspace(0, 1, 5)

# String coefficient → runtime cythonization
args = {"w": 1.0}
H_td = [H, "w * sin(t)"]

result = mesolve(H_td, psi0, tlist, [], [], args=args)
print("Result OK:", result.expect)
