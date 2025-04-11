# stuff-plus

[link-to-spec](https://docs.google.com/document/d/10daUDMT-W5eDnOqNCvLXCmvKB3Uf7R_lpSzxs3G73MQ/edit?tab=t.0)

3/5/25 Meeting Notes

Essential Starting Items:  
1. Start by the response being a binary encoding (0 = hit) (1 = called strike)
2. Normalize Based on Count  
  1. Article(to help normalize) https://medium.com/@bradleyjg03/june-2024-stuff-update-30d0da845316
3. Normalize approach angle based on location so that the pitches will hit the middle of the zone

Ways to improve the model:
  * New predictor(Called strike/whiff percentage/weak shots)
    * Number 0-1 (range, 0-most dangerous hit, 0.5-foul ball/weak hit, 1-whiff/called strike)  
      For instance:  
        Dangerous hits (0): High exit velocity and optimal launch angle for hitters.  
        Weak hits/foul balls (0.5): Low exit velocity or suboptimal launch angles.  
        Whiffs/strikes (1): No contact or called strikes.  
        Machine learning techniques like regression models, clustering, or neural networks could help classify pitches based on historical data. Tools like k-Nearest Neighbors (k-NN) or Gaussian Mixture Models (GMM) have been explored for pitch classification2. You could also incorporate batting performance data to refine the model further.  
    * Start by 0-1 binary encoding (0 = hit) (1 = called strike)
  * Normalize based on count 
    * Called strike percentage will be higher for 3-0 count(vs 0-2)
    * Standardize to count 
  * Normalize approach angle based on location:
    * Normalize all approach angles so that they will hit the middle of the zone 
    
    
3/10/25 Meeting Notes

* If approach angle needs to be normalized so that pitches will not be based on location
* If using spin direction, take sin and cos, and covert to radians(to get a relative spin axis)
* Normalizing for pitch count(No swings on 3-0 count or 0-2 counts)
  * A whiff in 3-0 count is worth more stuff than in 0-2 count
* Develop a criteria for model performance
  * Getting drafted, ERA, Walks, Strikeouts, Player Rankings
    
    
To do: checklist
- [] Calculate basic stuff-plus
- [] Look into count normalization
- [] Apply effective normalization
- [] Look into different ways to train models 
- [] Look for a model performance criterion
    
    