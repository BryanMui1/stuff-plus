# stuff-plus

[link-to-spec](https://docs.google.com/document/d/10daUDMT-W5eDnOqNCvLXCmvKB3Uf7R_lpSzxs3G73MQ/edit?tab=t.0)

[Trackman V3 Radar Spec](https://support.trackmanbaseball.com/hc/en-us/articles/5089413493787-V3-FAQs-Radar-Measurement-Glossary-Of-Terms)

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
  
4/17/25 Meeting Notes

* Keep looking into count and approach angle normalization 
* Keep looking for a model performance criterion
* Check your R^2 and try to tune our models
    
5/1/25 Meeting Notes  
Induced Vertical Break: Normalize by plate-location-height  
Get the model results for Fastball and Sliders(Do some EDA, try to push for higher R-squared)  

5/15/25
Go through and remove not in play/ground outs/fly outs

* See if filtering by base hits makes the dataset balanced to whiffs
* Try to improve the AUC by either oversampling or changing models

5/22/25

* Normalize ApproachAngle(Plate loc height, Rel height), HorzApproachAngle (Rel Side, Plate Loc side)
* Normalize SpinAxis, Rel side for lefties
    
To do: checklist

- Keep Vertical, HorzBreak, SpinRate, RelHeight unmodified
- Normalize ApproachAngle(Plate loc height, Rel height), HorzApproachAngle (Rel Side, Plate Loc side)
- Flip Relside(normalize lefties & righties)
- strike zone normalization based on plate_loc height and plate_loc side
- Make data cleaning pipeline, one for pitching data, the other for hitting data
- Start trying models

Random ideas:

- What if we trained a model that would predict ExitSpeed, Angle, Direction, HitSpinRate for even the ball pitches, 
and if that model generalizes well with stuff to be able to impute hit characteristics for even the balls thrown? 
- To add on the above point ^ if we trained a model using the data with hits to predict the contact, as well train a model 
or in the same model to predict the percent chance for a swinging strike. Then we could interpolate the data for balls and non contact
pitch calls, and use that as a response variable to calculate Stuff+. For actual hits/whiffs, we could just set the percentage chance to whiff 
as 100% or use the real hit data. Somehow we would combine the two columns(Hit characteritics and P(Whiff)) to make a new hybrid statistic

    
    