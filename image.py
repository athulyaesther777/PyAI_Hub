# Generative Mandelbrot art — impressive visual output
# This code generates a high-resolution Mandelbrot set image and saves it to /mnt/data/mandelbrot.png
# It uses matplotlib (single plot) and numpy. No explicit color settings are provided (matplotlib defaults used).

import numpy as np
import matplotlib.pyplot as plt

# Image / fractal parameters
width, height = 1200, 900        # resolution (pixels)
re_start, re_end = -2.2, 1.0     # real axis range
im_start, im_end = -1.3, 1.3     # imaginary axis range
max_iter = 400                   # iteration limit for escape time

# Create complex plane grid
real = np.linspace(re_start, re_end, width)
imag = np.linspace(im_start, im_end, height)
real_grid, imag_grid = np.meshgrid(real, imag)
c = real_grid + 1j * imag_grid

# Compute Mandelbrot escape iterations (vectorized)
z = np.zeros_like(c, dtype=np.complex128)
escape_iter = np.full(c.shape, max_iter, dtype=int)

for i in range(max_iter):
    mask = np.abs(z) <= 2.0
    z[mask] = z[mask] * z[mask] + c[mask]
    newly_escaped = mask & (np.abs(z) > 2.0)
    escape_iter[newly_escaped] = i

# Smooth coloring (normalized float values)
# This reduces banding and creates a pleasing gradient
with np.errstate(divide='ignore', invalid='ignore'):
    # compute continuous (smooth) iteration counts
    zn = z
    nu = np.where(escape_iter < max_iter, 
                  escape_iter + 1 - np.log(np.log(np.abs(zn)))/np.log(2),
                  escape_iter)
    norm = nu / nu.max()

# Plot (single plot, default matplotlib colormap used)
plt.figure(figsize=(12, 9), dpi=100)
plt.imshow(norm, extent=(re_start, re_end, im_start, im_end), origin='lower', aspect='auto')
plt.axis('off')  # hide axes for a clean, gallery-style image
plt.title('Mandelbrot Set — generative art', fontsize=16)
plt.tight_layout()

# Save output
output_path = '/mnt/data/mandelbrot.png'
plt.savefig(output_path, bbox_inches='tight', pad_inches=0.02)
plt.show()

print(f"Saved image to: {output_path}")
