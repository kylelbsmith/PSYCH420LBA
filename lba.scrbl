#lang scribble/base

@(require scriblib/figure)
@(require scribble/manual)

@title{Linear Ballistic Accumulator Model}
@italic{Group 5: Kyle, Yueping, Li, & Annie | Dec 2022}

@section{Introduction: What is LBA?}

The LBA Model of decision-making represents n choices as a race between n accumulators.
@image["LBAoverview.png"]

@section{History of LBA}
@image["LBAhistory.png"]

@section{Building the LBA Model}
For a given number of choices, the LBA model is implemented by graphing a simple linear line y=mx+b on a 2D plane with the following:
@image["Elementdetails.png"]


@section{Pros and Cons of LBA}
Pros:
1.Linear nature of LBA as a choice response time model allows for easily interpretable “analytic solutions for predicted distributions and probabilities” (Brown and Heathcote, 2007)
2.Solutions using the LBA model can be used with any number of response choices (N = 1, 2, … , k)
Cons:
@image["recency-effect-primacy-effect.png"]

1.Leaky Competitive Accumulator (Usher & McClelland), includes non-linear random variability to oscillate the start points (k) and drift rates (d) 

These fluctuations mimic changes in Na+ / K+ membrane pot. and firing rates in BN

LBA removes random variability in favour of simpler model, deviates further from BN

Authors argue all models have biological inaccuracies; should not cast away LBA implications

2.LBA model also leaves out other sources of variability:

Random-dot kinematograms (moment-to-moment var.)

Non-linear biases (if one source of evidence heavily introduced at beginning or end of sequence, responses will reflect these biases).

Cognitive Biases (Primacy & Recency Effect)
@image["recency-effect-primacy-effect.png"]

@section{Applications of LBA}
Understanding the effects of Methylphenidate using the linear ballistic accumulator model


@bold{Why should we care about it?}

“Methylphenidate is used to treat children with attention deficit hyperactivity disorder (ADHD).
It helps with hyperactivity and impulsive behaviour, and allows them to concentrate better.
It is also used to treat adults with ADHD or narcolepsy (a sleep disorder).
Methylphenidate is only available on prescription.
It comes as standard (immediate release) tablets and capsules and slow release (also called extended, modified or prolonged release) tablets and capsules.”

@italic{Click @hyperlink["https://www.nhs.uk/medicines/methylphenidate-children/#:~:text=Methylphenidate%20is%20used%20to%20treat,is%20only%20available%20on%20prescription"]{here} for more details.}

We all should care about mental health, and that leads us to the LBA model, the model will help us understand more about how this medication works in terms of response time and evidence accumulation.

@bold{How is  the model related to the methyphenidate?}

•There are enough evidences of the effect of methylphenidate towards simple perceptual tasks.

E.g. Reading a word, recall a name of an object

People who received treatment of methylphenidate have improved their response time towards simple tasks.

•But there were Lack of evidence of how methylphenidate improves cognitive ability on conflict tasks.

E.g. Tasks that involves interference.

What is a task that involves interference? Here is an example.

@bold{The Flanker's Test}

@(image "Flanker's test.png")

The Flanker's test require participants to tell the researcher the direction of the middle arrow.
There are two types of the condition.
The first condition is congruent condition, where all the arrows are toward to the same direction.
But the second condition, which is the incongruent condition, the middle arrow is the opposite direction with the other arrows.

If the middle arrows are marked in colors, it is easy to identify which direction the arrow towards to.
If the participants are told which type of the condition they are doing, it will also be easy to identify the direction of the middle arrow.
However, in a real test, they won't be told, neither will be the middle arrow marked in color. So, it takes time and effort.
If we try to think the flanker's test in a LBA model, the threshold might be lower due to the biaes (other arrows), and the response time will be longer.  

@bold{Hypothesis}

They hypothesis (a promised hypothesis) that the methylphenidate and other stimulants improves evidence accumulation by increasing accumulation accuracy, (focus more on related evidence and less on unrelated evidence) thus increase response time and cognitive performance. So, the model fits the effects of methylphenidate. (Weigard, Heathcote & Sripada,2019)

•They want to use the LBA to analyse how the methylphenidate influence people’s cognitive ability on conflict tasks.
 
@bold{Conclusion}

•By using the LBA model, they found that the methylphenidate can improve cognitive ability by reducing response threshold and increase the accumulation accuracy. (Weigard, Heathcote & Sripada, 2019) 

@bold{References}

Weigard, A., Heathcote, A. & Sripada, C. Modeling the effects of methylphenidate on interference and evidence accumulation processes using the conflict linear ballistic accumulator.
@italic{Psychopharmacology}
236, 2501–2512 (2019). https://doi.org/10.1007/s00213-019-05316-x


@section{Further Readings}

@bold{Applications:}

@(image "Methylphenidate.png")

@hyperlink["https://link.springer.com/article/10.1007/s00213-019-05316-x"]{Modeling the effects of methylphenidate on interference and evidence accumulation processes using the conflict linear ballistic accumulator}

@(image "ABM.png")

@hyperlink["https://doi.org/10.3389/fpsyg.2019.02447"]{Linear Ballistic Accumulator Modeling of Attentional Bias Modification Revealed Disturbed Evidence Accumulation of Negative Information by Explicit Instruction}

@bold{Programming the LBA model with R and Matlab}

@(image "R.png")

@hyperlink["https://search.r-project.org/CRAN/refmans/rtdists/html/LBA.html"]{The Linear Ballistic Accumulator (LBA) - R}

@(image "Matlab.png")

@hyperlink["https://github.com/smfleming/LBA"]{The Linear Ballistic Accumulator (LBA) - Matlab}

@bold{methods for fitting the LBA model}

@(image "Methods.png")

@hyperlink["https://link-springer-com.proxy.lib.uwaterloo.ca/content/pdf/10.3758/BRM.41.4.1095"]{Getting more from accuracy and response time data: Methods for fitting the linear ballistic accumulator}

