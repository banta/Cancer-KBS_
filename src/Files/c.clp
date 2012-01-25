;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Cancer KBS              ;;
;; Created by Bernard Banta ;;
;;            Alex Odhiambo ;;
;;        and Stephen Ooko  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(clear)
(reset)

(deftemplate Patient
(slot name)
(slot height)
(slot weight)
(slot sex))

(deftemplate Symptoms
(slot underweight)
(slot nipple)
(slot abdominal_pain)
(slot shoulder_pain)
(slot fever)
(slot fatigue)
(slot oozes_sores)
(slot irritated_skin)
(slot urinate_pain)
(slot inability_urinate)
(slot weak_urine)
(slot bloody_urine)
(slot leg_unkle_swelling)
(slot hypertension)
(slot back_side_pain)
(slot wheezing)
(slot pneumonia_bronchitis)
(slot shortness_breath)
(slot persistent_cough)
(slot blood_caughing)
(slot hoarseness)
(slot appetite_loss)
(slot excessive_brusing)
(slot phy_exercise_intolerance)
(slot abnormal_bleeding)
(slot internal_organs_enlargement)
(slot weakness)
(slot blood_stool)
(slot persistent_nausea_vormiting)
(slot abdominal_bloating)
(slot change_bowel_habits)
(slot excessive_tired)
(slot unusual_heavy_discharge)
(slot pelvic_pain)
(slot bleeding_after_sex)
(slot bleeding_during_douching))

(deftemplate Cancer
(slot name))

(deftemplate Type
(slot type))


(defrule BML
	(Patient (name ?name)(weight ?weight)(height ?height))
	=>
	(assert (bmi (/ ?weight ?height) ?name))
)

(defrule underWeight
	(bmi ?bmi1 ?name1)(test (<= ?bmi1 19.9))
	=>
	(assert (Symptoms (underweight yes)))(printout t ?name1 " is UnderWeight" crlf)
)

(defrule BreastCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (nipple yes) ))))
	=>
	(assert (Type (type BreastCancer))) (printout t ?name " is likely to have Breast Cancer" crlf)
)

(defrule liverCancer
	(and (Patient (name ?name)) (exists (Symptoms (oozes_sores yes) (shoulder_pain yes))))
	=>
	(assert (Type (type LiverCancer))) (printout t ?name " is likely to have Liver Cancer" crlf)
)

(defrule SkinCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (irritated_skin yes)) (Symptoms (abdominal_pain yes) (irritated_skin yes)))))
	=>
	(assert (Type (type SkinCancer))) (printout t ?name " is likely to have Skin Cancer" crlf)
)

(defrule ProstateCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (bloody_urine yes)) (Symptoms (urinate_pain yes) (inability_urinate yes)) (Symptoms (urinate_pain yes) (inability_urinate yes) (weak_urine yes) (bloody_urine yes)))))
	=>
	(assert (Type (type ProstateCancer))) (printout t ?name " is likely to have Prostate Cancer" crlf)
)

(defrule KidneyCancer
	(and (Patient (name ?name)) (exists (or  (Symptoms (bloody_urine yes) (back_side_pain yes)) (Symptoms (fatigue yes) (underweight yes) (hypertension yes) (bloody_urine yes) (back_side_pain yes)))))
	=>
	(assert (Type (type KidneyCancer))) (printout t ?name " is likely to have Kidney Cancer" crlf)
)

(defrule LungCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (wheezing yes)) (Symptoms (shortness_breath yes)) (Symptoms (shortness_breath yes) (persistent_cough yes)) (Symptoms (wheezing yes) (pneumonia_bronchitis yes) (shortness_breath yes) (persistent_cough yes) (hoarseness yes) (underweight yes) (appetite_loss)))))
	=>
	(assert (Type (type LungCancer))) (printout t ?name " is likely to have Lung Cancer" crlf)
)

(defrule LeukemiaCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (excessive_brusing yes)) (Symptoms (phy_exercise_intolerance yes)) (Symptoms (excessive_brusing yes) (fatigue yes) (phy_exercise_intolerance yes) (abdominal_pain) (underweight yes) (abnormal_bleeding yes) (internal_organs_enlargement yes) (weakness yes)))))
	=>
	(assert (Type (type LeukemiaCancer))) (printout t ?name " is likely to have Leukemia" crlf)
)

(defrule StomachCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (persistent_nausea_vormiting yes)) (Symptoms (appetite_loss yes) (abdominal_bloating yes)) (Symptoms (blood_stool yes) (persistent_nausea_vormiting yes) (appetite_loss yes) (abdominal_bloating yes) (change_bowel_habits yes)))))
	=>
	(assert (Type (type StomachCancer))) (printout t ?name " is likely to have Stomach Cancer" crlf)
)

(defrule CervicalCancer
	(and (Patient (name ?name)) (exists (or (Symptoms (bleeding_after_sex yes)) (Symptoms (bleeding_after_sex yes)) (Symptoms (unusual_heavy_discharge yes) (pelvic_pain yes) (bleeding_after_sex yes) (bleeding_during_douching yes)))))
	=>
	(assert (Type (type CervicalCancer))) (printout t ?name " is likely to have Cervical Cancer" crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Breast
    (Cancer (name Breast))
    =>
    (printout t "Breast cancer is a disease in which malignant (cancer)"crlf"cells form in the tissues of the breast." crlf)
    (printout t "Symptoms are; pain in the nipple, swelling/lumps of breasts " crlf)
)

(defrule Liver
    (Cancer (name Liver))
    =>
    (printout t "Liver cancer does not usually cause any symptoms in the early stages."crlf"As the disease progresses, liver cancer symptoms begin to appear" crlf)
    (printout t "Symptoms are; pain in the right side of the abdomen,"crlf"Pain or discomfort in the right shoulder." crlf)
    (printout t "People suffering from hepatitis or cirrhosis are most at risk"crlf"of developing liver cancer." crlf)
)

(defrule Skin
    (Cancer (name Skin))
    =>
    (printout t "Skin cancer is one of the most preventable types of cancer."crlf)
    (printout t "Excessive exposure to the sun's UV rays are the most common cause of the disease."crlf)
)

(defrule Prostate
    (Cancer (name Prostate))
    =>
    (printout t "Prostate cancer symptoms do not usually appear until the disease has advanced,"crlf"and many times has already been diagnosed."crlf)
    (printout t "However, there are symptoms you should watch aware of,"crlf"especially signs and symptoms related to urination."crlf)
)

(defrule Kidney
    (Cancer (name Kidney))
    =>
    (printout t "There are many variations of kidney cancer."crlf"The most commonly diagnosed type of kidney cancer"crlf)
    (printout t "is renal cell carcinoma. It accounts for more than"crlf"85% of kidney cancer diagnosis'."crlf)
)

(defrule Lung
    (Cancer (name Lung))
    =>
    (printout t "Lung cancer symptoms are commonly not experienced until the disease had advanced,"crlf"sometimes delaying diagnosis. The symptoms of lung"crlf)
    (printout t "cancer also mimic the symptoms of other benign illnesses."crlf)
)

(defrule Leukemia
    (Cancer (name Leukemia ))
    =>
    (printout t "Leukemia is a disease that affects both children and adults."crlf"It begins in the bone marrow and spreads to other parts"crlf)
    (printout t "of the body. Leukemia symptoms can occur"crlf"all of a sudden or gradually progress."crlf)
    (printout t "The symptoms of leukemia are broad, but there are specific"crlf"symptoms of leukemia to keep an eye out for:"crlf)
    (printout t "e.g. fever, infection, excessive bruising, fatigue"crlf)
)

(defrule Stomach
    (Cancer (name Stomach))
    =>
    (printout t "Stomach cancer often does not have symptoms in the early stages,"crlf"or they can be vague and non-specific -- such as nausea or weight loss."crlf)
    (printout t "Symptoms vary and depend on how advanced the disease"crlf)
)

(run)





