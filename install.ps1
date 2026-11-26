# Installateur client - Mo' Creatures Adventure - Forge 1.20.1-47.4.0
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$repo = 'https://github.com/nini17800/mo-creatures-adventure-modpack/raw/main'
$mc   = Join-Path $env:APPDATA '.minecraft'
$ua   = @{ 'User-Agent' = 'Mozilla/5.0' }

$files = @(
    @('976817','5270720','forge-medievalend-1.0.1.jar','mods'),
    @('1141533','6704877','too_many_bows-forge-3.6.7.jar','mods'),
    @('220318','4617259','BiomesOPlenty-1.20.1-18.0.0.592.jar','mods'),
    @('663560','5731144','fossilsorigins-1.0.2-forge-1.20.1.jar','mods'),
    @('581495','6020952','oculus-mc1.20.1-1.8.0.jar','mods'),
    @('499980','6740431','moonlight-1.20-2.14.13-forge.jar','mods'),
    @('289412','6431737','ftb-quests-forge-2001.4.13.jar','mods'),
    @('549225','6531428','framework-forge-1.20.1-0.7.15.jar','mods'),
    @('238222','6600311','jei-1.20.1-forge-15.20.0.112.jar','mods'),
    @('306770','6164575','Patchouli-1.20.1-84.1-FORGE.jar','mods'),
    @('961754','5870242','freshly-modded-1-5-10.zip','resourcepacks'),
    @('551736','6044481','sodiumdynamiclights-forge-1.0.10-1.20.1.jar','mods'),
    @('626761','4923828','Towns-and-Towers-1.12-Fabric+Forge.jar','mods'),
    @('372534','5097798','pamhc2foodcore-1.20.4-1.0.5.jar','mods'),
    @('855414','6488484','irons_spellbooks-1.20.1-3.4.0.9.jar','mods'),
    @('615352','6563409','bettervillage-forge-1.20.1-3.3.1-all.jar','mods'),
    @('510089','5271360','YungsBetterDungeons-1.20-Forge-4.0.4.jar','mods'),
    @('576825','4817267','lucky-block-forge-1.20.1-13.0.jar','mods'),
    @('250398','4646682','Controlling-forge-1.20.1-12.0.2.jar','mods'),
    @('328085','6641603','create-1.20.1-6.0.6.jar','mods'),
    @('887484','4637926','xaeros_waystones_compability-1.0.jar','mods'),
    @('404183','5598990','endrem_forge-5.3.3-R-1.20.1.jar','mods'),
    @('521480','9243644','skinlayers3d-forge-1.11.4-mc1.20.1.jar','mods'),
    @('227639','5468648','twilightforest-1.20.1-4.3.2508-universal.jar','mods'),
    @('365460','4625518','pamhc2trees-1.20-1.0.2.jar','mods'),
    @('832882','6732854','structureessentials-1.20.1-4.8.jar','mods'),
    @('693313','6616784','Corgilib-Forge-1.20.1-4.0.3.4.jar','mods'),
    @('606159','4203288','auudio_forge_1.0.3_MC_1.19.3.jar','mods'),
    @('962544','6608610','Oh-The-Trees-Youll-Grow-forge-1.20.1-1.3.13.jar','mods'),
    @('551520','5723247','betterfpsdist-1.20.1-6.0.jar','mods'),
    @('631016','4769439','YungsBetterDesertTemples-1.20-Forge-3.0.3.jar','mods'),
    @('682567','5156621','EasyAnvils-v8.0.2-1.20.1-Forge.jar','mods'),
    @('938643','5109692','melody_forge_1.0.3_MC_1.20.1-1.20.4.jar','mods'),
    @('240633','5979609','inventorysorter-1.20.1-23.0.8.jar','mods'),
    @('317780','6538337','XaerosWorldMap_1.39.9_Forge_1.20.jar','mods'),
    @('237664','5159498','ironfurnaces-1.20.1-4.1.6.jar','mods'),
    @('263420','6515024','Xaeros_Minimap_25.2.6_Forge_1.20.jar','mods'),
    @('892382','5847887','mes-1.3.4-1.20-forge.jar','mods'),
    @('623908','6459777','[forge]ctov-3.4.14.jar','mods'),
    @('817423','6747998','azurelib-neo-1.20.1-3.0.9.jar','mods'),
    @('302113','6330928','effortlessbuilding-1.20.1-3.10.jar','mods'),
    @('521590','4985588','Highlighter-1.20.1-forge-1.1.9.jar','mods'),
    @('619320','6724330','sophisticatedstorage-1.20.1-1.3.53.1189.jar','mods'),
    @('1088877','5665877','FarmersStructures-1.0.3-1.20.jar','mods'),
    @('453763','5494142','FreshAnimations_v1.9.2.zip','resourcepacks'),
    @('421850','5769971','YungsApi-1.20-Forge-4.0.6.jar','mods'),
    @('678384','6734469','Solas Shader V2.9.zip','shaderpacks'),
    @('255308','6134920','aether-1.20.1-1.5.2-neoforge.jar','mods'),
    @('959431','5238542','betterendcities-1.0.0-1.20.1.jar','mods'),
    @('252848','4712189','NaturesCompass-1.20.1-1.11.2-forge.jar','mods'),
    @('975460','6245108','pandalib-forge-mc1.20-0.5.2-SNAPSHOT.jar','mods'),
    @('659110','5558225','RegionsUnexploredForge-0.5.6+1.20.1.jar','mods'),
    @('55438','4602980','cfm-forge-1.20.1-7.0.0-pre36.jar','mods'),
    @('363703','4802505','goblintraders-forge-1.20.1-1.9.3.jar','mods'),
    @('890127','5761411','Connector-1.0.0-beta.46+1.20.1.jar','mods'),
    @('367706','6722592','fancymenu_forge_3.6.2_MC_1.20.1.jar','mods'),
    @('955399','5787839','GlitchCore-forge-1.20.1-0.0.1.1.jar','mods'),
    @('908741','5681725','embeddium-0.3.31+mc1.20.1.jar','mods'),
    @('378609','6418133','toms_storage-1.20-1.7.1.jar','mods'),
    @('453925','6363155','mcw-fences-1.2.0-1.20.1forge.jar','mods'),
    @('309927','6418456','curios-forge-5.14.1+1.20.1.jar','mods'),
    @('699989','6391000','mobs_of_mythology-forge-1.20.1-2.1.2.jar','mods'),
    @('1070751','6706622','Oh-The-Biomes-Weve-Gone-Forge-1.6.2.jar','mods'),
    @('429235','4810975','ferritecore-6.0.1-forge.jar','mods'),
    @('312353','6399828','artifacts-forge-9.5.16.jar','mods'),
    @('276951','5503516','comforts-forge-6.4.0+1.20.1.jar','mods'),
    @('410295','5028413','konkrete_forge_1.8.0_MC_1.20-1.20.1.jar','mods'),
    @('398521','6597298','FarmersDelight-1.20.1-1.2.8.jar','mods'),
    @('433760','6738627','notenoughanimations-forge-1.10.1-mc1.20.1.jar','mods'),
    @('361276','6330326','lootr-forge-1.20-0.7.35.91.jar','mods'),
    @('1103431','6100812','sodiumoptionsapi-forge-1.0.10-1.20.1.jar','mods'),
    @('400933','5977657','mcw-trapdoors-1.1.4-mc1.20.1forge.jar','mods'),
    @('618298','6753839','sophisticatedcore-1.20.1-1.2.72.1024.jar','mods'),
    @('456239','4658750','EasyMagic-v8.0.1-1.20.1-Forge.jar','mods'),
    @('891328','5918168','DiagonalWindows-v8.1.5-1.20.1-Forge.jar','mods'),
    @('817651','5193465','YungsBetterNetherFortresses-1.20-Forge-2.0.6.jar','mods'),
    @('360203','6066968','guardvillagers-1.20.1-1.6.10.jar','mods'),
    @('897669','5331760','YungsBetterJungleTemples-1.20-Forge-2.0.5.jar','mods'),
    @('508933','6387680','DistantHorizons-fabric-forge-2.3.2-b-1.20.1.jar','mods'),
    @('60089','5338457','MouseTweaks-forge-mc1.20.1-2.25.1.jar','mods'),
    @('852603','5638270','FreshCompats_v1.6.zip','resourcepacks'),
    @('404468','6130786','ftb-teams-forge-2001.3.1.jar','mods'),
    @('1028436','5422341','Animation_Overhaul-forge-1.20.x-1.3.1.jar','mods'),
    @('535489','6399601','sound-physics-remastered-forge-1.20.1-1.4.13.jar','mods'),
    @('531351','5981334','continuity-3.0.0+1.20.1.forge.jar','mods'),
    @('412082','6749363','supplementaries-1.20-3.1.36.jar','mods'),
    @('419699','5137938','architectury-9.2.14-forge.jar','mods'),
    @('880630','6231030','fallingtrees-forge-mc1.20-0.13.2-SNAPSHOT.jar','mods'),
    @('404465','6164053','ftb-library-forge-2001.2.9.jar','mods'),
    @('223852','6549483','StorageDrawers-1.20.1-12.9.14.jar','mods'),
    @('307465','6516726','lilcritters-1.20.1-1.0.2-TropEx3-alpha1.jar','mods'),
    @('606989','4954861','UndergroundVillages-forge-1.20.1-2.1.0.jar','mods'),
    @('586157','5772681','Necronomicon-Forge-1.6.0+1.20.1.jar','mods'),
    @('351264','5402061','kotlinforforge-4.11.0-all.jar','mods'),
    @('546670','6720394','Essential_1-3-8-4_forge_1-20-1.jar','mods'),
    @('348831','6725032','doubledoors-1.20.1-7.1.jar','mods'),
    @('326652','5470032','cupboard-1.20.1-2.7.jar','mods'),
    @('858542','5284015','Searchables-forge-1.20.1-1.0.3.jar','mods'),
    @('353426','5266122','Mo-Glass-1.7.1-MC1.20.1-Forge.jar','mods'),
    @('74924','6642332','Mantle-1.20.1-1.11.63.jar','mods'),
    @('316582','6624394','corpse-forge-1.20.1-1.0.21.jar','mods'),
    @('335493','6662027','dynamic-fps-3.9.5+minecraft-1.20.0-forge.jar','mods'),
    @('661261','6369719','flib-1.20.1-0.0.15.jar','mods'),
    @('419139','4626083','Faithful 64x - Beta 9.zip','resourcepacks'),
    @('623764','6421940','jamlib-forge-1.3.5+1.20.1.jar','mods'),
    @('581942','6702774','zawa-1.20.1-1.1.0-IntelligentAnimals3-alpha3.jar','mods'),
    @('889079','6289136','fabric-api-0.92.2+1.11.12+1.20.1.jar','mods'),
    @('659887','5639538','simplyswords-forge-1.56.0-1.20.1.jar','mods'),
    @('1093018','5990023','64x_Enchanted_Books_Sh20_EBE.zip','resourcepacks'),
    @('1090999','6393071','addonslib-1.20.1-1.4.jar','mods'),
    @('332609','4622524','elementaryores-1.20.1-1.1.0.jar','mods'),
    @('361026','6325698','occultism-1.20.1-1.141.4.jar','mods'),
    @('380413','5642538','§eExtended_Illumina_1.20x.zip','resourcepacks'),
    @('661293','5654964','SmartBrainLib-forge-1.20.1-1.15.jar','mods'),
    @('634277','5163537','MissingWilds-forge-1.2.1+1.20.1.jar','mods'),
    @('661517','6434243','gml-4.0.11-all.jar','mods'),
    @('580681','6495768','immersive_armors-1.7.0+1.20.1-forge.jar','mods'),
    @('570544','5567578','eatinganimation-1.20.1-5.1.0.jar','mods'),
    @('363569','6732754','mcw-windows-2.4.0-1.20.1forge.jar','mods'),
    @('252818','6655713','DynamicTrees-1.20.1-1.4.5.jar','mods'),
    @('636540','5351581','Structory_1.20.x_v1.3.5.jar','mods'),
    @('351725','6528751','mcw-bridges-3.1.0-mc1.20.1forge.jar','mods'),
    @('936015','6742615','lithostitched-forge-1.20.1-1.4.11.jar','mods'),
    @('852096','4761916','mythicmounts-20.1-7.4.2-forge.jar','mods'),
    @('938917','7164863','accessories-neoforge-1.0.0-beta.48+1.20.1.jar','mods'),
    @('245755','6552631','waystones-forge-1.20.1-14.1.13.jar','mods'),
    @('400514','5724570','easy-villagers-forge-1.20.1-1.1.23.jar','mods'),
    @('378646','6146379','mcw-doors-1.1.2-mc1.20.1forge.jar','mods'),
    @('574913','5898414','crittersandcompanions-forge-2.2.2.jar','mods'),
    @('852886','6557090','DynamicTreesTerralith-1.20.1-1.2.5.jar','mods'),
    @('463155','6241090','fallingleaves-1.20.1-2.1.2.jar','mods'),
    @('568563','5982136','entity_texture_features_forge_1.20.1-6.2.9.jar','mods'),
    @('476520','4657750','EasyPaxel1.20.1(Forge)vs1.0.3.jar','mods'),
    @('897116','6623931','refurbished_furniture-forge-1.20.1-1.0.14.jar','mods'),
    @('250832','6602224','elevatorid-1.20.1-1.9.1-forge.jar','mods'),
    @('969422','5918171','DiagonalWalls-v8.0.4-1.20.1-Forge.jar','mods'),
    @('348521','5729105','cloth-config-11.1.136-forge.jar','mods'),
    @('389665','4769063','YungsBetterMineshafts-1.20-Forge-4.0.4.jar','mods'),
    @('248787','4770828','appleskin-forge-mc1.20.1-2.5.1.jar','mods'),
    @('323976','4613527','BetterAnimationsCollection-v8.0.0-1.20.1-Forge.jar','mods'),
    @('497122','6439095','inventorio-mc1.20.1-forge-v1.10.4.jar','mods'),
    @('535960','6396824','mcwbyg-1.20.1-1.2.1.jar','mods'),
    @('1021783','5388398','realmrpg_quests-0.1.1-forge-1.20.1.jar','mods'),
    @('1138130','6616671','corpsecurioscompat-1.20.x-Forge-3.0.2.jar','mods'),
    @('386134','6700666','ftb-ultimine-forge-2001.1.6.jar','mods'),
    @('291874','6398227','SereneSeasons-forge-1.20.1-9.1.0.2.jar','mods'),
    @('313213','6134040','GeneticAnimals-0_11_12.jar','mods'),
    @('1265366','6750570','mocreatures-1.20.1-1.0.0.beta3-spawnfix.jar','mods'),
    @('838411','6280155','suppsquared-1.20-1.1.21.jar','mods'),
    @('388172','6658942','geckolib-forge-1.20.1-4.7.2.jar','mods'),
    @('60028','6296111','Aquaculture-1.20.1-2.5.5.jar','mods'),
    @('901344','5193815','YungsBetterEndIsland-1.20-Forge-2.0.6.jar','mods'),
    @('308989','5281700','caelus-forge-3.2.0+1.20.1.jar','mods'),
    @('520110','5838149','Iceberg-1.20.1-forge-1.1.25.jar','mods'),
    @('853794','5206484','dungeons-and-taverns-3.0.3.f[Forge].jar','mods'),
    @('531730','6000240','§eTorches§8-§eReimagined§0_§8[v1.4]§0.zip','resourcepacks'),
    @('856996','5869180','cristellib-1.1.6-forge.jar','mods'),
    @('852665','5107399','MutantMonsters-v8.0.7-1.20.1-Forge.jar','mods'),
    @('452834','6326903','rightclickharvest-forge-4.5.3+1.20.1.jar','mods'),
    @('1241234','6721454','cubic-sun-moon-v1.8.3a.zip','resourcepacks'),
    @('658587','4587214','player-animation-lib-forge-1.0.2-rc1+1.20.jar','mods'),
    @('1111586','6606910','YungsCaveBiomes-1.20.1-Forge-2.0.5.jar','mods'),
    @('513688','5512076','Terralith_1.20.x_v2.5.4.jar','mods'),
    @('342584','6429218','collective-1.20.1-8.3.jar','mods'),
    @('1028108','6654541','tacz-1.20.1-1.1.6-hotfix.jar','mods'),
    @('500273','4612695','VisualWorkbench-v8.0.0-1.20.1-Forge.jar','mods'),
    @('538392','6181667','modonomicon-1.20.1-forge-1.77.6.jar','mods'),
    @('580689','6640968','lootintegrations-1.20.1-4.7.jar','mods'),
    @('256717','5278538','Clumps-forge-1.20.1-12.0.0.4.jar','mods'),
    @('74072','6635554','TConstruct-1.20.1-3.10.1.76.jar','mods'),
    @('989479','5362380','bbb-1.20.1-forge-1.0.1.jar','mods'),
    @('1135500','6510009','lootintegrations_ctov-1.4.jar','mods'),
    @('361385','4687624','pamhc2crops-1.20-1.0.3.jar','mods'),
    @('1264423','6523425','baguettelib-1.20.1-Forge-1.0.0.jar','mods'),
    @('563928','6290448','TerraBlender-forge-1.20.1-3.0.1.10.jar','mods'),
    @('844662','6001134','entity_model_features_forge_1.20.1-2.4.1.jar','mods'),
    @('531761','6588893','balm-forge-1.20.1-7.3.31-all.jar','mods'),
    @('1149302','6510143','lootintegrations_mostructures-1.2.jar','mods'),
    @('324717','6271651','Jade-1.20.1-Forge-11.13.1.jar','mods'),
    @('1159169','5990381','Undopia_3D_Iron_Bars_1.20.1_v.1.0.zip','resourcepacks'),
    @('495476','6387081','PuzzlesLib-v8.1.32-1.20.1-Forge.jar','mods'),
    @('402231','5147171','pamhc2foodextended-1.20.4-1.0.1.jar','mods'),
    @('532727','4601234','libraryferret-forge-1.20.1-4.0.0.jar','mods'),
    @('422301','6753197','sophisticatedbackpacks-1.20.1-3.23.21.1272.jar','mods'),
    @('563464','6585607','easy_mob_farm-forge-1.20.1-10.0.0.jar','mods'),
    @('274259','4882500','carryon-forge-1.20.1-2.1.2.7.jar','mods'),
    @('458048','5918173','DiagonalFences-v8.1.5-1.20.1-Forge.jar','mods'),
    @('627557','6515577','ComplementaryReimagined_r5.5.1.zip','shaderpacks'),
    @('649832','6633054','createoreexcavation-1.20-1.6.4.jar','mods')
)

Write-Host ''
Write-Host "=== Mo' Creatures Adventure - installation (189 fichiers) ===" -ForegroundColor Green
Write-Host "Dossier Minecraft : $mc"
$mods = Join-Path $mc 'mods'
New-Item -ItemType Directory -Force $mc, (Join-Path $mc 'shaderpacks'), (Join-Path $mc 'resourcepacks') | Out-Null

# Sauvegarde des anciens mods
$marker = Join-Path $mods '.mo-creatures-adventure'
if ((Test-Path -LiteralPath $mods) -and (-not (Test-Path $marker)) -and (Get-ChildItem -LiteralPath $mods -File -ErrorAction SilentlyContinue)) {
    $bak = Join-Path $mc ('mods_sauvegarde_' + (Get-Date -Format 'yyyyMMdd_HHmmss'))
    Move-Item -LiteralPath $mods $bak
    Write-Host "Anciens mods deplaces dans : $bak" -ForegroundColor Yellow
}
New-Item -ItemType Directory -Force $mods | Out-Null
Set-Content -Path $marker -Value 'installe par install.ps1'

$tmpf = Join-Path $env:TEMP 'mca_dl.tmp'
$i = 0; $fail = @()
foreach ($f in $files) {
    $i++
    $projId = $f[0]; $fileId = $f[1]; $name = $f[2]
    $dest = Join-Path (Join-Path $mc $f[3]) $name
    Write-Host ("[{0,3}/{1}] {2}" -f $i, $files.Count, $name)
    if (Test-Path -LiteralPath $dest) { continue }
    $url = "https://www.curseforge.com/api/v1/mods/$projId/files/$fileId/download"
    $ok = $false
    for ($try = 1; ($try -le 3) -and (-not $ok); $try++) {
        try {
            Invoke-WebRequest -Uri $url -Headers $ua -OutFile $tmpf -UseBasicParsing
            Move-Item -LiteralPath $tmpf -Destination $dest -Force
            $ok = $true
        } catch { Start-Sleep -Seconds 2 }
    }
    if (-not $ok) { $fail += $name; Write-Host '      ECHEC' -ForegroundColor Red }
}

# Configs du modpack
Write-Host 'Installation des configs...'
$tmp = Join-Path $env:TEMP ('mca_' + [guid]::NewGuid())
New-Item -ItemType Directory -Force $tmp | Out-Null
Invoke-WebRequest -Uri "$repo/Mo-Creatures-Adventure.zip" -OutFile "$tmp\pack.zip" -UseBasicParsing
Expand-Archive "$tmp\pack.zip" -DestinationPath "$tmp\x" -Force
Copy-Item "$tmp\x\overrides\*" $mc -Recurse -Force
Remove-Item $tmp -Recurse -Force

# Forge
$forgeName = 'forge-1.20.1-47.4.0'
if (-not (Test-Path (Join-Path $mc 'versions\1.20.1-forge-47.4.0'))) {
    $jar = Join-Path ([Environment]::GetFolderPath('Desktop')) "$forgeName-installer.jar"
    Write-Host 'Telechargement de Forge 1.20.1-47.4.0...'
    Invoke-WebRequest -Uri "https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/$forgeName-installer.jar" -OutFile $jar -UseBasicParsing
    $java = $null
    $cmd = Get-Command java -ErrorAction SilentlyContinue
    if ($cmd) { $java = $cmd.Source } else {
        $j = Get-ChildItem "${env:ProgramFiles(x86)}\Minecraft Launcher\runtime", "$env:LOCALAPPDATA\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime" -Recurse -Filter javaw.exe -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($j) { $java = $j.FullName }
    }
    if ($java) {
        Write-Host '>>> Dans la fenetre Forge : laisse "Install client" coche et clique OK.' -ForegroundColor Cyan
        Start-Process -FilePath $java -ArgumentList "-jar `"$jar`"" -Wait
        Remove-Item $jar -ErrorAction SilentlyContinue
    } else {
        Write-Host "Java introuvable : double-clique sur $jar (sur ton Bureau) pour installer Forge." -ForegroundColor Yellow
    }
} else { Write-Host 'Forge 1.20.1-47.4.0 deja installe.' }

Write-Host ''
if ($fail.Count) {
    Write-Host ("{0} fichier(s) n'ont pas pu etre telecharges :" -f $fail.Count) -ForegroundColor Red
    $fail | ForEach-Object { Write-Host "  - $_" }
    Write-Host 'Relance l''installateur (il reprend la ou il s''est arrete).'
} else {
    Write-Host 'Tout est installe !' -ForegroundColor Green
}
Write-Host 'Lance le launcher Minecraft, choisis le profil "forge" (1.20.1-forge-47.4.0),'
Write-Host 'mets au moins 8 Go de RAM (Installations > Modifier > Plus d''options > -Xmx8G)'
Write-Host 'et rejoins le serveur : dedication-radiation.tun.ply.gg'
