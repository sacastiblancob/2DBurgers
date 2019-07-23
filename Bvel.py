#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 19 16:07:49 2019
compare velocities
@author: apreziosir
"""

import numpy as np
import matplotlib.pyplot as plt

a = np.loadtxt('Boundary_0020.dat', skiprows = 2)
b = np.linspace(1,100,100)

# Plotting u velocities
plt.figure(2)
plt.scatter(b, a[:,0], c = 'red')
plt.plot(b, a[:,2], c = 'blue')

# Plotting w velocities
#plt.scatter(a[:,1], c = 'red')
#plt.plot(a[:,3], c = 'blue')