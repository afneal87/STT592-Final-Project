# Presentation figures 
# relies on STT592_final_project.Rmd file to have been run


# Univariate Figures -------------------------------------------

## Page loads ------------------------------------------------

# TS plot of raw variable 

autoplot(web_train) +
  theme_classic() +
  theme(text = element_text(family = 'serif')) +
  labs(y = 'Number of Page Loads',
       title = 'Daily Page Loads')
ggsave(filename = 'page_loads_ts.tiff', dpi = 600)

# ACF and PACF of raw variable 

tiff(filename = 'page_loads_acf_pacf.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif', mfrow = c(2,1))
acf(web_ts)
pacf(web_ts)
dev.off()

# TS plot of differenced series 
autoplot(diff(web_train, lag =7)) +
  theme_classic() +
  theme(text = element_text(family = 'serif')) +
  labs(y = 'Number of Page Loads',
       title = 'Daily Page Loads Seasonally Differenced Once')
ggsave(filename = 'page_loads_diff_ts.tiff', dpi = 600)

# ACF and PACF of differenced series
tiff(filename = 'page_loads_diff_acf_pacf.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif', mfrow = c(2,1))
acf(web_1)
pacf(web_1)
dev.off()

# model diagnostics 
tiff(filename = 'page_loads_model_diag.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif')
tsdiag(model1)
dev.off()


## Unique visits -------------------------------------------------

# time series of raw data
autoplot(unique.train) +
  theme_classic() +
  labs(y = 'Number of Unique Visits',
       title = 'Daily Unique Website Visits') +
  theme(text = element_text(family = 'serif'))
ggsave(filename = 'unique.tiff', dpi = 600)

# acf and pacf of raw variables 
tiff(filename = 'unique_acf_pacf.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif', mfrow = c(2,1))
acf(unique.train)
pacf(unique.train)
dev.off()

# TS after seasonal difference
autoplot(unique.sdiff.1) +
  theme_classic() +
  theme(text = element_text(family = 'serif')) +
  labs(y = 'Number of unique visits',
       title = 'Unique Website Visits Seasonally Differenced Once')
ggsave(filename = 'unique_diff_ts.tiff', dpi = 600)

# ACF and PACF of differenced data 
tiff(filename = 'unique_diff_acf_pacf.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif', mfrow = c(2,1))
acf(unique.sdiff.1)
pacf(unique.sdiff.1)
dev.off()

## returning visits ----------------------------------------------------

# TS of raw data 
autoplot(return.train) +
  theme_classic() +
  theme(text = element_text(family = 'serif')) +
  labs(y = 'Number of Returning Visits',
       title = 'Daily Returning Visits')
ggsave(filename = 'return_ts.tiff', dpi = 600)

# ACF and PACF of raw data 
tiff(filename = 'return_acf_pacf.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif', mfrow = c(2,1))
acf(return.train)
pacf(return.train)
dev.off()

# TS of seasonal difference 
autoplot(return.sdiff.1) +
  theme_classic() +
  theme(text = element_text(family = 'serif')) +
  labs(title = 'Daily Returning Visits Seasonally Differenced Once',
       y = 'Number of Return Visits')
ggsave(filename = 'return_diff_ts.tiff', dpi = 600)

# ACF and PACF of seasonal difference 
tiff(filename = 'return_acf_pacf_diff.tiff', width = 10, height = 16, units = 'in', res = 600)
par(family = 'serif', mfrow = c(2,1))
acf(return.sdiff.1)
pacf(return.sdiff.1)
dev.off()


# VARMA model --------------------------------------------
autoplot(multi, facet = TRUE) +
  theme_minimal() +
  theme(text = element_text(family = 'serif')) +
  labs(y = 'Number of Visits')
ggsave(filename = 'multi.tiff', dpi = 600)

autoplot(multi_sdiff_1, facet = TRUE) +
  theme_minimal() +
  theme(text = element_text(family = 'serif')) +
  labs(y = 'Number of Visits')
ggsave(filename = 'multi_diff.tiff', dpi = 600)


tiff(filename = 'varma_forecast.tiff', width = 20, height = 8, units = 'in', res = 600)
par(family = 'serif', mfrow = c(1,3))
