#!/usr/bin/env bash

#pg-01.d4
pg_01="psql -h d1 -p 5401 -d gb-sites -U gb-query"
#pg-02.d4
pg_02="psql -h d2 -p 5402 -d gb-sites -U gb-query"
#pg-03.d4
pg_03="psql -h d3 -p 5403 -d gb-sites -U gb-query"
#pg-05.d8
pg_05="psql -h d5 -p 5405 -d gb-sites -U gb-query"
#pg-06.d8
pg_06="psql -h d6 -p 5406 -d gb-sites -U gb-query"
#pg-mx.d8
pg_boss="psql -h d7 -p 5407 -d gb-boss -U gb-query"
pg_companies="psql -h d7 -p 5407 -d gb-companies -U gb-query"
pg_stat="psql -h d7 -p 5407 -d gb-stat -U gb-query-stat"
#pg-11.d5
pg_11="psql -h d5 -p 5411 -d gb-sites -U gb-query"
#pg-12.d6
pg_12="psql -h d6 -p 5412 -d gb-sites -U gb-query"
#pg-13.d7
pg_13="psql -h d7 -p 5413 -d gb-sites -U gb-query"

#pg-pb.d7
pg_pb="psql -h d7 -p 5408 -d pb-sites -U pb-query"
pg_pb_boss="psql -h d7 -p 5408 -d pb-boss -U pb-query"

s_boss=$pg_boss
s_companies=$pg_companies
s_stat=$pg_stat
s_template=$pg_05
s_pbboss=$pg_pb_boss

s_1=$pg_01
s_73=$pg_01
s_74=$pg_01
s_75=$pg_01
s_110=$pg_01
s_111=$pg_01
s_116=$pg_01
s_117=$pg_01
s_118=$pg_01
s_140=$pg_01
s_141=$pg_01
s_142=$pg_01
s_120=$pg_02
s_121=$pg_02
s_122=$pg_02
s_123=$pg_02
s_124=$pg_02
s_126=$pg_02
s_127=$pg_02
s_128=$pg_02
s_129=$pg_02
s_155=$pg_02
s_157=$pg_02
s_130=$pg_03
s_132=$pg_03
s_133=$pg_03
s_134=$pg_03
s_135=$pg_03
s_136=$pg_03
s_137=$pg_03
s_138=$pg_03
s_112=$pg_05
s_113=$pg_05
s_119=$pg_05
s_151=$pg_05
s_156=$pg_05
s_158=$pg_05
s_159=$pg_05
s_160=$pg_05
s_161=$pg_05
s_162=$pg_05
s_163=$pg_05
s_165=$pg_05
s_180=$pg_05
s_181=$pg_05
s_182=$pg_05
s_183=$pg_05
s_185=$pg_05
s_186=$pg_05
s_187=$pg_05
s_71=$pg_06
s_72=$pg_06
s_76=$pg_06
s_114=$pg_06
s_115=$pg_06
s_125=$pg_06
s_131=$pg_06
s_139=$pg_06
s_143=$pg_06
s_150=$pg_06
s_153=$pg_06
s_166=$pg_06
s_167=$pg_06
s_168=$pg_06
s_169=$pg_06
s_171=$pg_06
s_172=$pg_06
s_173=$pg_06
s_175=$pg_06
s_176=$pg_06
s_177=$pg_06
s_178=$pg_06
s_179=$pg_06
s_80=$pg_11
s_188=$pg_05
s_70=$pg_11
s_189=$pg_05
s_69=$pg_11
s_190=$pg_05
s_191=$pg_05
s_192=$pg_01
s_193=$pg_02
s_195=$pg_03
s_196=$pg_03
s_197=$pg_03
s_198=$pg_03
s_199=$pg_03
s_200=$pg_01
s_201=$pg_02
s_202=$pg_11
s_203=$pg_11
s_205=$pg_11
s_206=$pg_06
s_207=$pg_11
s_208=$pg_06
s_209=$pg_11
s_211=$pg_05
s_210=$pg_11
s_212=$pg_11
s_215=$pg_05
s_213=$pg_05
s_216=$pg_05
s_217=$pg_05
s_218=$pg_11
s_219=$pg_05
s_220=$pg_12
s_68=$pg_13
s_221=$pg_12
s_222=$pg_06
s_223=$pg_12
s_225=$pg_12
s_226=$pg_06
s_227=$pg_06
s_228=$pg_12
s_800=$pg_12
s_801=$pg_12
s_229=$pg_06
s_230=$pg_05
s_231=$pg_13
s_232=$pg_13
s_802=$pg_13
s_233=$pg_13
s_235=$pg_05
s_236=$pg_05
s_237=$pg_05
s_803=$pg_13
s_238=$pg_13
s_63=$pg_13
s_64=$pg_13
s_61=$pg_05
s_62=$pg_05
s_239=$pg_13
s_65=$pg_01
s_66=$pg_01
s_805=$pg_13
s_251=$pg_11
s_251=$pg_11
s_251=$pg_11
s_252=$pg_11
s_253=$pg_01
s_255=$pg_01
s_256=$pg_11
s_257=$pg_11
s_258=$pg_11
s_259=$pg_11
s_260=$pg_01
s_261=$pg_11
s_806=$pg_11
s_262=$pg_11
s_263=$pg_11
s_807=$pg_11
s_265=$pg_11
s_266=$pg_01
s_267=$pg_01
s_268=$pg_01
s_808=$pg_11
s_269=$pg_01
s_271=$pg_12
s_270=$pg_02
s_272=$pg_02
s_50=$pg_03
s_273=$pg_12
s_300=$pg_12
s_301=$pg_12
s_302=$pg_12
s_303=$pg_12
s_306=$pg_03
s_305=$pg_03
s_307=$pg_12
s_308=$pg_12
s_309=$pg_12
