# stuff-plus

[spec](https://docs.google.com/document/d/10daUDMT-W5eDnOqNCvLXCmvKB3Uf7R_lpSzxs3G73MQ/edit?tab=t.0)s

3/5/25
Ways to improve the model:
  New predictor(Called strike/whiff percentage/weak shots)
    + Number 0-1 (range, 0-most dangerous hit, 0.5-foul ball/weak hit, 1-whiff/called strike)
      For instance:
        Dangerous hits (0): High exit velocity and optimal launch angle for hitters.
        Weak hits/foul balls (0.5): Low exit velocity or suboptimal launch angles.
        Whiffs/strikes (1): No contact or called strikes.
        Machine learning techniques like regression models, clustering, or neural networks could help classify pitches based on historical data. Tools like k-Nearest Neighbors (k-NN) or Gaussian Mixture Models (GMM) have been explored for pitch classification2. You could also incorporate batting performance data to refine the model further.
# Would you like to dive deeper into the methodology or explore specific examples?
    + Start by 0-1 binary encoding (0 = hit) (1 = called strike)
  Normalize based on count 
    + Called strike percentage will be higher for 3-0 count(vs 0-2)
    + Standardize to count 
  Normalize approach angle based on location:
    + Normalize all approach angles so that they will hit the middle of the zone 
    
  Article(to help normalize) https://medium.com/@bradleyjg03/june-2024-stuff-update-30d0da845316