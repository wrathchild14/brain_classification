# LDA 
3 records
data/S001/S001R04.edf
data/S001/S001R08.edf
data/S001/S001R12.edf

## testing n folds (n for bandpass = 35 , ar = false)
- n = 10
   All records-Test   TP= 13 FN=  8; FP=  8 TN= 12; Se:  61.90 Sp:  60.00 CA:  60.98 AUC:  64.05

- n = 20
   All records-Test   TP= 13 FN=  8; FP=  8 TN= 12; Se:  61.90 Sp:  60.00 CA:  60.98 AUC:  64.05

## testing for AR p 

- p = 4
   All records-Test   TP= 40 FN=  2; FP=  1 TN= 43; Se:  95.24 Sp:  97.73 CA:  96.51 AUC:  97.40
- p = 2
   All records-Test   TP= 40 FN=  2; FP=  1 TN= 43; Se:  95.24 Sp:  97.73 CA:  96.51 AUC:  97.40
the vectors look different, but all in the minus
- p = 16
All records-Test   TP= 40 FN=  2; FP=  1 TN= 43; Se:  95.24 Sp:  97.73 CA:  96.51 AUC:  97.40
   All records-Learn  TP= 40 FN=  2; FP=  1 TN= 43; Se:  95.24 Sp:  97.73 CA:  96.51 AUC:  97.40
   20% holdout-Test  Single  TP=  7 FN=  2; FP=  7 TN=  1; Se:  77.78 Sp:  12.50 CA:  47.06 AUC:  48.61
   20% holdout-Learn Single  TP=  7 FN=  2; FP=  7 TN=  1; Se:  77.78 Sp:  12.50 CA:  47.06 AUC:  94.87
     20% holdout-Test  Nrep  TP=  5 FN=  4; FP=  5 TN=  3; Se:  55.56 Sp:  37.50 CA:  47.06 AUC:  47.25
     20% holdout-Learn Nrep  TP=  5 FN=  4; FP=  5 TN=  3; Se:  55.56 Sp:  37.50 CA:  47.06 AUC:  96.34
   Cross-valid-Test  Single  TP= 24 FN= 18; FP= 27 TN= 17; Se:  57.14 Sp:  38.64 CA:  47.67 AUC:  49.57
   Cross-valid-Learn Single  TP= 24 FN= 18; FP= 27 TN= 17; Se:  57.14 Sp:  38.64 CA:  47.67 AUC:  96.31
     Cross-valid-Test  Nrep  TP= 25 FN= 17; FP= 27 TN= 17; Se:  59.52 Sp:  38.64 CA:  48.84 AUC:  48.18
     Cross-valid-Learn Nrep  TP= 25 FN= 17; FP= 27 TN= 17; Se:  59.52 Sp:  38.64 CA:  48.84 AUC:  96.75
   Leave one o-Test   TP= 25 FN= 17; FP= 28 TN= 16; Se:  59.52 Sp:  36.36 CA:  47.67 AUC:  46.48
   Leave one o-Learn  TP= 25 FN= 17; FP= 28 TN= 16; Se:  59.52 Sp:  36.36 CA:  47.67 AUC:  97.29
worse CA and AUC on the other classifications

5 records
data/S001/S001R04.edf
data/S001/S001R06.edf
data/S001/S001R08.edf
data/S001/S001R10.edf
data/S001/S001R12.edf
data/S001/S001R14.edf

- no ap
   All records-Test   TP= 17 FN= 25; FP= 18 TN= 26; Se:  40.48 Sp:  59.09 CA:  50.00 AUC:  56.06
   All records-Learn  TP= 17 FN= 25; FP= 18 TN= 26; Se:  40.48 Sp:  59.09 CA:  50.00 AUC:  56.06
   20% holdout-Test  Single  TP=  5 FN=  3; FP=  6 TN=  3; Se:  62.50 Sp:  33.33 CA:  47.06 AUC:  48.61
   20% holdout-Learn Single  TP=  5 FN=  3; FP=  6 TN=  3; Se:  62.50 Sp:  33.33 CA:  47.06 AUC:  57.31
     20% holdout-Test  Nrep  TP=  3 FN=  5; FP=  4 TN=  5; Se:  37.50 Sp:  55.56 CA:  47.06 AUC:  47.94
     20% holdout-Learn Nrep  TP=  3 FN=  5; FP=  4 TN=  5; Se:  37.50 Sp:  55.56 CA:  47.06 AUC:  56.80
   Cross-valid-Test  Single  TP= 15 FN= 27; FP= 20 TN= 24; Se:  35.71 Sp:  54.55 CA:  45.35 AUC:  46.75
   Cross-valid-Learn Single  TP= 15 FN= 27; FP= 20 TN= 24; Se:  35.71 Sp:  54.55 CA:  45.35 AUC:  56.13
     Cross-valid-Test  Nrep  TP= 16 FN= 26; FP= 21 TN= 23; Se:  38.10 Sp:  52.27 CA:  45.35 AUC:  46.30
     Cross-valid-Learn Nrep  TP= 16 FN= 26; FP= 21 TN= 23; Se:  38.10 Sp:  52.27 CA:  45.35 AUC:  56.24
   Leave one o-Test   TP= 15 FN= 27; FP= 23 TN= 21; Se:  35.71 Sp:  47.73 CA:  41.86 AUC:  40.26
   Leave one o-Learn  TP= 15 FN= 27; FP= 23 TN= 21; Se:  35.71 Sp:  47.73 CA:  41.86 AUC:  55.83

- ap
   All records-Test   TP= 40 FN=  2; FP=  1 TN= 43; Se:  95.24 Sp:  97.73 CA:  96.51 AUC:  97.40
   All records-Learn  TP= 40 FN=  2; FP=  1 TN= 43; Se:  95.24 Sp:  97.73 CA:  96.51 AUC:  97.40
   20% holdout-Test  Single  TP=  5 FN=  3; FP=  6 TN=  3; Se:  62.50 Sp:  33.33 CA:  47.06 AUC:  50.00
   20% holdout-Learn Single  TP=  5 FN=  3; FP=  6 TN=  3; Se:  62.50 Sp:  33.33 CA:  47.06 AUC:  97.14
     20% holdout-Test  Nrep  TP=  5 FN=  3; FP=  5 TN=  3; Se:  62.50 Sp:  37.50 CA:  50.00 AUC:  48.56
     20% holdout-Learn Nrep  TP=  5 FN=  3; FP=  5 TN=  3; Se:  62.50 Sp:  37.50 CA:  50.00 AUC:  96.48
   Cross-valid-Test  Single  TP= 24 FN= 18; FP= 31 TN= 13; Se:  57.14 Sp:  29.55 CA:  43.02 AUC:  45.51
   Cross-valid-Learn Single  TP= 24 FN= 18; FP= 31 TN= 13; Se:  57.14 Sp:  29.55 CA:  43.02 AUC:  96.72
     Cross-valid-Test  Nrep  TP= 25 FN= 17; FP= 28 TN= 17; Se:  59.52 Sp:  37.78 CA:  48.28 AUC:  47.65
     Cross-valid-Learn Nrep  TP= 25 FN= 17; FP= 28 TN= 17; Se:  59.52 Sp:  37.78 CA:  48.28 AUC:  96.78
   Leave one o-Test   TP= 25 FN= 17; FP= 28 TN= 16; Se:  59.52 Sp:  36.36 CA:  47.67 AUC:  46.48
   Leave one o-Learn  TP= 25 FN= 17; FP= 28 TN= 16; Se:  59.52 Sp:  36.36 CA:  47.67 AUC:  97.29