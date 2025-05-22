library(dplyr)


pitch_data <- read.csv("~/Downloads/Pitch Type Model 2/UCLA2023-2024.csv")


# Calculate swinging strike percentage
swstr_percentage <- pitch_data %>%
  group_by(PitcherId, TaggedPitchType) %>%
  summarise(
    total_pitches = n(),
    swinging_strikes = sum(PitchCall == "StrikeSwinging"),
    swstr_percent = (swinging_strikes / total_pitches) * 100,
    .groups = 'drop'
  )

print(swstr_percentage)
