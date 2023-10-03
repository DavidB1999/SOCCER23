
require(ggplot2)
require(lme4)
require(dplyr)
require(readr)



# ----------------------------------------------------------------------------
# No random intercept

Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = 0 + ScScA *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = 0 + ScScB *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0 + ScScC *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = 0 + ScScD *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = 0 + ScScE *1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')

  
  
# NO RANDOM INTERCEPT --> Linear and mixed linear with identical beta
# ---------------------------------------------------------------------
# Random Intercept pos. correlated with predictor

Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = -1 + ScScA *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = -0.5 + ScScB *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0 + ScScC *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = 0.5 + ScScD *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = 1 + ScScE *1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')


# RANDOM INTERCEPT POSITIVELY CORRELATED WITH PREDICTOR --> RANDOM INTERCEPT REDUCES BETA
# ---------------------------------------------------------------------------------------
# Random intercept negatively correlated with predicor




Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = 1 + ScScA *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = 0.5 + ScScB *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0 + ScScC *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = -0.5 + ScScD *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = -1 + ScScE *1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')


# RANDOM INTERCEPT NEGATIVELY CORRELATED WITH PREDICTOR --> RANDOM INTERCEPT INCREASES BETA




# --------------------------------------------------------------------------------
# --------------------------------------------------------------------------------
# negative predictor 


# ----------------------------------------------------------------------------
# No random intercept

Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = 0 + ScScA *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = 0 + ScScB *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0 + ScScC *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = 0 + ScScD *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = 0 + ScScE *-1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')



# NO RANDOM INTERCEPT --> Linear and mixed linear with identical beta
# ---------------------------------------------------------------------
# Random Intercept pos. correlated with predictor

Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = -1 + ScScA *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = -0.5 + ScScB *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0 + ScScC *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = 0.5 + ScScD *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = 1 + ScScE *-1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')


# RANDOM INTERCEPT POSITIVELY CORRELATED WITH PREDICTOR --> RANDOM INTERCEPT REDUCES BETA
# -----------------------------------------------------------------------------
# Random intercept negatively correlated with predicor




Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = 1 + ScScA *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = 0.5 + ScScB *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0 + ScScC *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = -0.5 + ScScD *-1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = -1 + ScScE *-1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')


# RANDOM INTERCEPT NEGATIVELY CORRELATED WITH PREDICTOR --> RANDOM INTERCEPT INCREASES BETA


df <- read_csv("MLM_data_e100.csv")
df <- df |> 
  mutate(possession_zero = possession -50)


PS <- lmer(Outcome_num ~ ASS_16m_100s_diff + possession_zero + OQ_gd + (1|Team), data = df,  REML = FALSE)
RIs = unlist(ranef(PS, drop=TRUE))

SS_means <- df |> group_by(Team) |> 
  summarise(ASS_16m_100s = mean(ASS_16m_100s_diff),
            ASS_16m_300s = mean(ASS_16m_300s_diff),
            ASS_16m_500s = mean(ASS_16m_500s_diff),
            ASS_30m_100s = mean(ASS_30m_100s_diff),
            ASS_30m_300s = mean(ASS_30m_300s_diff),
            ASS_30m_500s = mean(ASS_30m_500s_diff))

cor(RIs, SS_means$ASS_16m_100s)

PS <- lmer(Outcome_num ~ ASS_16m_300s_diff + possession_zero + OQ_gd + (1|Team), data = df,  REML = FALSE)
RIs = unlist(ranef(PS, drop=TRUE))
cor(RIs, SS_means$ASS_16m_300s)


PS <- lmer(Outcome_num ~ ASS_16m_500s_diff + possession_zero + OQ_gd + (1|Team), data = df,  REML = FALSE)
RIs = unlist(ranef(PS, drop=TRUE))
cor(RIs, SS_means$ASS_16m_500s)


PS <- lmer(Outcome_num ~ ASS_30m_100s_diff + possession_zero + OQ_gd + (1|Team), data = df,  REML = FALSE)
RIs = unlist(ranef(PS, drop=TRUE))
cor(RIs, SS_means$ASS_30m_100s)


PS <- lmer(Outcome_num ~ ASS_30m_500s_diff + possession_zero + OQ_gd + (1|Team), data = df,  REML = FALSE)
RIs = unlist(ranef(PS, drop=TRUE))
cor(RIs, SS_means$ASS_30m_500s)


# RANDOM INTERCEPT IS A LITTLE LESS STRONGLY CORRELATED WITH SUCCESS SCORE FOR 30-METER


# Random Intercept pos. correlated with predictor

Team  = c('A', 'B', 'C', 'D', 'E')
Teams = rep(Team, each=10)
ScScA = rnorm(10, mean=-1, sd=0.2)
ScScB = rnorm(10, mean=-0.5, sd=0.2)
ScScC = rnorm(10, mean=0, sd=0.2)
ScScD = rnorm(10, mean=0.5, sd=0.2)
ScScE = rnorm(10, mean=1, sd=0.2)
ScSc = c(ScScA, ScScB, ScScC, ScScD, ScScE)
# success-score * beta + error
MOA = -1 + ScScA *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOB = -0.3 + ScScB *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOC = 0.1 + ScScC *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOD = 0.5 + ScScD *1.5 + rnorm(10, mean=0.5, sd=0.15)
MOE = 0.8 + ScScE *1.5+ rnorm(10, mean=0.5, sd=0.15)
MO = c(MOA, MOB, MOC, MOD, MOE)

df = data.frame(
  Team = Teams,
  Success_Score = ScSc,
  Match_outcome = MO
)


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  stat_smooth(method='lm')

# mixed model
mm <- lmer(Match_outcome ~ Success_Score + (1|Team), data = df,  REML = FALSE)
summary(mm)

# linear model
lm <- lm(Match_outcome ~ Success_Score, data=df)
summary(lm)


xA = c(df |> filter(Team =='A') |>  pull(Success_Score), rep(NA, 40))
xB = c(df |> filter(Team =='B') |>  pull(Success_Score), rep(NA, 40))
xC = c(df |> filter(Team =='C') |>  pull(Success_Score), rep(NA, 40))
xD = c(df |> filter(Team =='D') |>  pull(Success_Score), rep(NA, 40))
xE = c(df |> filter(Team =='E') |>  pull(Success_Score), rep(NA, 40))

yA = c(predict(mm)[1:10], rep(NA, 40))
yB = c(predict(mm)[11:20], rep(NA, 40))
yC = c(predict(mm)[21:30], rep(NA, 40))
yD = c(predict(mm)[31:40], rep(NA, 40))
yE = c(predict(mm)[41:50], rep(NA, 40))


ggplot(df, aes(x=Success_Score, y=Match_outcome))+
  geom_point(aes(color=Team))+
  geom_smooth(method='lm', linetype='dotted', size=2)+
  geom_line(aes(y=yA, x=xA), color='#ee5e5f')+
  geom_line(aes(y=yB, x=xB), color='#a8c686')+
  geom_line(aes(y=yC, x=xC), color='#00cc99')+
  geom_line(aes(y=yD, x=xD), color='#0174c3')+
  geom_line(aes(y=yE, x=xE), color='#a90076')


