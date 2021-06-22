package com.adapt.controllers;

import com.adapt.dto.ParticipantStudy;
import com.adapt.services.ParticipantService;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import static com.google.common.collect.Lists.newArrayList;
import static java.nio.charset.Charset.forName;

@RestController
@RequestMapping("/api/adapt/questionnaire/")
public class QuestionnaireController {
    private final ParticipantService participantService;

    public QuestionnaireController(ParticipantService participantService) {
        this.participantService = participantService;
    }


    @GetMapping("medicine")
    public List<String> testMethod1() {
        return newArrayList("Acarbose","Accupril","Acebutolol","Aceon","Acetazolamide","Actos","Adalat","Aldactazide","Aldactone","Aldomet","Aldoril","Altace","Amaryl","Amiloride + hydrochlorothiazide","Amiloride hydrochloride","Amlodipine","Amlodipine + benazepril","Antara","Apresazide","Apresoline","Aranesp","Aspirin","Atacand","Atenolol","Atenolol + chlorthalidone","atorvastatin","Avandia","Avapro","Benazepril","Benazepril + hydrochlorothiazide","Bepridil","Betapace","Betaxolol","Bisoprolol + hydrochlorothiazide","Bisoprolol/hydrochlorothiazide","Blocadren","Bumetanide","Bumex","Byetta","Caduet","Calan","Calcitriol","Calcium Carbonate","Caltrate","Candesartan","Capoten","Capozide","Captopril","Captopril + hydrochlorothiazide","Cardene","Cardizem","Cardura","Carteolol","Cartrol","Carvedilol","Catapres","Chlorothiazide","Chlorthalidone","cholestyramine","Clonidine","Clopidogrel","Clorpres","colesevelam","Colestid","colestipol","Coreg","Corgard","Corzide","Coumadin","Covera","Cozaar","Crestor","Dalteparin","Danaparoid","darbepoetin alfa","Demadex","Dexferrum","DiaBeta","Diamox","Digoxin","Dilacor","Diltiazem","Diovan","Dipyridamole","Diruil","Doxazosin","Dyazide","DynaCirc","Dyrenium","Edecrin","Enalapril","Enalapril + hydrochlorothiazide","Enoxaparin","epoetin alfa","epoetin beta-methoxy polyethylene glycol","Epogen","Eprosartan","Esidrix","Estrostep Fe","Ethacrynic acid","Exenatide","ezetimibe","ezetimibe + simvastatin","Felodipine","Felodipine + enalapril","fenofibrate","Feraheme","Fergon","Ferralet","Ferrlecit","ferrous gluconate","ferumoxytol","fluvastatin","Fortamet","Fosinopril","Fragmin","Furosemide","gemfibrozil","Glimepiride","Glipizide","Glucophage","Glucotrol","Glyburide","Glynase","Glyset","Guanabenz","Guanfacine","heme iron polypeptide/folic acid","Heparin","Hydralazine","Hydralazine + hydrochlorothiazide","Hydralazine hydrochloride","Hydrochlorothiazide","HydroDiuril","Hytrin","Hyzaar","Imferon","Indapamide","Inderal","Inderal LA","Inderide","INFeD","Innohep","Irbesartan","iron dextran","Isoptin","Isordil","Isosorbide dinitrate","Isradipine","Januvia","Kerlone","Labetalol","Lanoxin","Lanozicaps","Lasix","Lescol","Levatol","Lexxel","Linagliptin","Lipitor","Liraglutide","Lisinopril","Lisinopril + hydrochlorothiazide","Livalo","Loestrin Fe","Lopid","Lopressor","Lopressor HCT","Losartan","Losartan + hydrochlorothiazide","Lotensin","Lotensin HCT","Lotrel","lovastatin","Lovenox","Lozol","Mavik","Maxide","Metformin","Methyldopa","Methyldopa + hydrochlorothiazide","Metolazone","Metoprolol","Metoprolol + hydrochlorothiazide","Mevacor","Micardis","Microzide","Midamor","Miglitol","Minipress","Mircera","Moduretic","Moexipril","Monopril","Mykrox","Nadolol","Nadolol + bendroflumethiazide","Nateglinide","Natrecor","Nesiritide","Niaspan","Nicardipine","nicotinic acid","Nifedipine","Nimodipine","Nimotop","Nisoldipine","Nitrates","Nitroglycerin","Norethindrone Ethinyl Estradiol Ferrous Fumarate/sulfate","Normodyne","Norvasc","Omontys","Onglyza","Orgaran","peginesatide","Penbutolol","Perindopril","Persantine","Pioglitazone","pitavastatin","Plavix","Plendil","Pramlintide","Prandin","Pravachol","pravastatin","Prazosin","Precose","Prinivil","Prinzide","Procardia XL","Procrit","Proferrin","Proferrin-Forte","Propranolol","Propranolol + hydrochlorothiazide","Questran","Quinapril","Ramipril","Renagel","Renvela","Repaglinide","Reserpine","Rocaltrol","Rosiglitazone","rosuvastatin","Saxagliptin","Sectral","Serpasil","Sevelamer","Simron","simvastatin","Sitagliptin","sodium ferric gluconate complex","Sotalol","Spironolactone","Spironolactone + hydrochlorothiazide","Starlix","Sular","Symlin","Tarka","Telmisartan","Tenex","Tenoretic","Tenormin","Terazosin","Teveten","Thalidone","Tiazac","Ticlid","Ticlopidine","Timolol","Tinzaparin","Toprol","Torsemide","Tradjenta","Trandate","Trandolapril","Triamterene","Triamterene + hydrochlorothiazide","Univasc","Valsartan","Vascor","Vaseretic","Vasotec","Verapamil extended release + trandolapril","Verapamil hydrochloride","Verelan","Victoza","Vytorin","Warfarin","Welchol","Wytensin","Zaroxolyn","Zebeta","Zestoretic","Zestril","Zetia","Ziac","Ziac","Zocor");
    }

    @GetMapping(value = "questionnaireType", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    String getVascularQuestionnaire(@RequestParam Map<String, String> params) {
        String type = params.get("questionnaireType");

        switch (type) {
            case "Vascular Risk":
                return loadJson("questionnarie/vascular_v.1.json");
            case "Sleep Study":
                return loadJson("questionnarie/sleep_study_v_1.json");
            case "Everyday Cognition (E-Cog)":
                return loadJson("questionnarie/e-cog_v_1.json");
            case "Physical Activity Screening":
                return loadJson("questionnarie/exercise_v_1.json");
            case "Diet Screening":
                return loadJson("questionnarie/vascular_study.json");

            default:
                throw new IllegalStateException("Unexpected value: " + type);
        }
    }

    @PostMapping(value = "saveQuestionnaireFilled", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    boolean saveQuestionnaireFilled(@RequestBody ParticipantStudy participantStudy) {

        participantService.saveQuestionnaireFilled(participantStudy);
        return true;
    }

    @PostMapping(value = "getQuestionnaireFilled", consumes = "application/json", produces = "application/json")
    public @ResponseBody
    ParticipantStudy getQuestionnaireFilled(@RequestBody ParticipantStudy participantStudy) {
        return participantService.getQuestionnaireFilled(participantStudy);
    }

    private String loadJson(String path) {
        try {
            final InputStream givenInputStream = new ClassPathResource(path)
                    .getInputStream();
            return IOUtils.toString(givenInputStream, forName("UTF-8"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
