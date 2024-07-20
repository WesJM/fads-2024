PGDMP  ;    .                |           compliance_db    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    compliance_db    DATABASE     o   CREATE DATABASE compliance_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE compliance_db;
                postgres    false            �            1259    16399    doj_scrape_data    TABLE     �   CREATE TABLE public.doj_scrape_data (
    row_id bigint NOT NULL,
    article_title text NOT NULL,
    article_summary text NOT NULL,
    article_url text NOT NULL,
    date_published date NOT NULL,
    model_pred bit(1) NOT NULL
);
 #   DROP TABLE public.doj_scrape_data;
       public         heap    postgres    false            �            1259    16402    doj_scrape_data_row_id_seq    SEQUENCE     �   CREATE SEQUENCE public.doj_scrape_data_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.doj_scrape_data_row_id_seq;
       public          postgres    false    215                        0    0    doj_scrape_data_row_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.doj_scrape_data_row_id_seq OWNED BY public.doj_scrape_data.row_id;
          public          postgres    false    216            �            1259    16413    mytable    TABLE     t   CREATE TABLE public.mytable (
    name character varying(80),
    pet character varying(80),
    is_cool boolean
);
    DROP TABLE public.mytable;
       public         heap    postgres    false            �            1259    16422 
   test_table    TABLE     �   CREATE TABLE public.test_table (
    pk_id bigint NOT NULL,
    article_title text NOT NULL,
    article_summary text NOT NULL,
    article_url text NOT NULL,
    date_published date NOT NULL,
    model_prediction bit(1)
);
    DROP TABLE public.test_table;
       public         heap    postgres    false            �            1259    16425    test_table_pk_id_seq    SEQUENCE     }   CREATE SEQUENCE public.test_table_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.test_table_pk_id_seq;
       public          postgres    false    218            !           0    0    test_table_pk_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.test_table_pk_id_seq OWNED BY public.test_table.pk_id;
          public          postgres    false    219            |           2604    16403    doj_scrape_data row_id    DEFAULT     �   ALTER TABLE ONLY public.doj_scrape_data ALTER COLUMN row_id SET DEFAULT nextval('public.doj_scrape_data_row_id_seq'::regclass);
 E   ALTER TABLE public.doj_scrape_data ALTER COLUMN row_id DROP DEFAULT;
       public          postgres    false    216    215            }           2604    16426    test_table pk_id    DEFAULT     t   ALTER TABLE ONLY public.test_table ALTER COLUMN pk_id SET DEFAULT nextval('public.test_table_pk_id_seq'::regclass);
 ?   ALTER TABLE public.test_table ALTER COLUMN pk_id DROP DEFAULT;
       public          postgres    false    219    218                      0    16399    doj_scrape_data 
   TABLE DATA           z   COPY public.doj_scrape_data (row_id, article_title, article_summary, article_url, date_published, model_pred) FROM stdin;
    public          postgres    false    215   �                 0    16413    mytable 
   TABLE DATA           5   COPY public.mytable (name, pet, is_cool) FROM stdin;
    public          postgres    false    217   �                 0    16422 
   test_table 
   TABLE DATA           z   COPY public.test_table (pk_id, article_title, article_summary, article_url, date_published, model_prediction) FROM stdin;
    public          postgres    false    218   -       "           0    0    doj_scrape_data_row_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.doj_scrape_data_row_id_seq', 1, false);
          public          postgres    false    216            #           0    0    test_table_pk_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.test_table_pk_id_seq', 61, true);
          public          postgres    false    219                       2606    16412 /   doj_scrape_data doj_scrape_data_article_url_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.doj_scrape_data
    ADD CONSTRAINT doj_scrape_data_article_url_key UNIQUE (article_url);
 Y   ALTER TABLE ONLY public.doj_scrape_data DROP CONSTRAINT doj_scrape_data_article_url_key;
       public            postgres    false    215            �           2606    16410 $   doj_scrape_data doj_scrape_data_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.doj_scrape_data
    ADD CONSTRAINT doj_scrape_data_pkey PRIMARY KEY (row_id);
 N   ALTER TABLE ONLY public.doj_scrape_data DROP CONSTRAINT doj_scrape_data_pkey;
       public            postgres    false    215            �           2606    16433    test_table test_table_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.test_table
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (pk_id);
 D   ALTER TABLE ONLY public.test_table DROP CONSTRAINT test_table_pkey;
       public            postgres    false    218            �           2606    16460    test_table unique_title_url 
   CONSTRAINT     l   ALTER TABLE ONLY public.test_table
    ADD CONSTRAINT unique_title_url UNIQUE (article_title, article_url);
 E   ALTER TABLE ONLY public.test_table DROP CONSTRAINT unique_title_url;
       public            postgres    false    218    218                  x������ � �         V   x�%�;�@E��BLl�m��H$C�4�{1������ p#�P�C�ݸz ��6����v8)�]T3wMŪ6�T:�y� ��>�            x��}KrI���)r�i�`���
)�*Q���*��2@��|�b�����Ŝa��7������	P��c6�w	̌�p��{�>�ucS�������)��-�:�lf���u�-sݘ:yo2S�<���'7v�l��~���S�KQ��Ե�l��\�j�6�,tn���"�6�:7ɣm�ɭ�l���%mG^�yA���&��.��-R�%M�駤Y�&�M2�_3�W ��Iۃ�6��,t��a% X!ٻ���Ol�躶uC{�tZzw�S���4�
8�U���*��o>0���I9'�L2Y�^�.j����z�ך�M�79���x���ۃ�]Wfe�i�V����:�Ljk,J;\�+Mg��A��`z� qY��gS��!@:��IZ$)� -W���͓��Nz JԲP�;�QR��c�ǲ�p8CX�`�l�u�?������w����|��r�ZW?��T����T� W���\�O��?U1����O�H>:><~�_�������ѥ��r��[��Er����Ck��	G��E���B�:��'>�;�7vUV&�1 ��|4U���VWz��3��in�L������t��V%8s3N< �d��	q�9�3�B�Wza��"�
0&7)hGd�����6�W�I�,(��V���WnKbwvU���gW����mB�|0�_EC�d
⒚p�m���\���8F[��doZs��|�Ĝ	��u�,�ݺI�ڼ�Ʉ0�`|���j�9��KA�0os����xZٕ%1D���u�@��U�NJ�h53�s"�HZ$3����_���>�-�q2�9���U�[l@��!_;p���ᄴ~�\��zIt�ճ$�W�	[�Kk�u���s�wuӔUa�< ,fH�D9Cr��}.+�?U����[���&��G'ٸ.!EH����8��#�����Ӟ~����1�r�~+�˧�P|c ��?$�V`iH�ց�m`f�r������1E4�n�	n΋m7$������T��Ii��䚞�t�;S)^�@���S�m������&�9A̯A����qc��Ur��U���3�nLZ�n����e���+�WӉ�e�ܧ��4t6�/�;�bB3�sŘ��-u'���)Ѧ����Gߛ\���`"N%�U
�,���^��̚D��I��_ԣ�$�+��1������ҦK ��-�>3:���H�ۓ��N��X_���d�}��l?5T���@�J$�����x%ZI�"��AtwF��� 5�C(�aZ��j-����?�Z	��;���r���͠�.��D4=�:�nn�?�r��~�S:�.����J;D��a4�#7FdƵl�eg�#���j�$ �HE��GK.�2/O�d��>N��8kk�v%a��[6���P�c:T�x::������C�'&���Y9����LG2��	NZo;[٦��@��1O�0�wSy"/���XXH��x�Y�dؐ<�5�K	ӊm`G��L]��;�IF4����w�n¶41@�H�}Ō�ڵ<�D�W���]__ӵ�X&{��L�@��ǂ�-צr(��<���LN�ش���f	H�OF��.�?%��iP��&<5$�uź�*mJR<	1��7oҽ�N�"UL�Z9ҫ���1���t�/j��1�B��i"٥�-�,�l�>ݯ%sL��E���zf�d�zI)���n�������$�i��8P$!E����)�22��Ƀ�-� [N?��V�m�١�nxSz��ף��%To�1H�.df���ï63e�:׌HuOv�i�/\ң�S�&�C��`<��T�Cx�C000px6�2�"h���&��a�a�4�B��Y����4�9,�ÿJPm�Ep�eb�� �pJ�R��Jm��MG�[B�a^�eg'������5�'YC���̧��_������&���W�I����aq���ԒE��x7��I���Xv7˪lL*�E�U��Ij��g�g���&@�
�I�D�ۊi�	��xP�̣C���ۈ���+Y~�෣[�?ur�Gk�̐�ĉ5����J� ��SI[ݐ�Լ�;�|z��8�\�O◳4L�[4Ń%G���J��m���BB�yZ��U�׉6Љe�̠&_�F�-��$�˄cmu�A�%B+t)DU��!X�x�'����_��4�e�GhKv��ꭱ��%�`�a��hU:X�X䒬a#�2�r(7O�kA!����������ז�##�<��1ؕ�����ax��p�6Ͽ�<�peWޤ����6��T8�brC	.��,V	�)�/$8XL���H����)�M<2�QX�'��ֶ�����5я^f�vJ�lI,�3�@��)���C���@Ǉɓ��B$E����wS�K<����R@@�n~]�}CN�u�
X�	~���u��$p�GR����r���dk�P���C���H<��4��,"�S��&g^W&m���3�M�����{����_Hk��n�O��5i��
:�t" o�Y�@���N*l*d���z�6���в��R�t����&{��w�_�`���:�5��sk4�8�����%�x������#r�}1k�ᴩ;-Q��;	3�p��;��x,z��W��9�X�7]o,H���Ӄ�Ys���v�#�R*�2���x�W3&�j�N�n$�K�)�Mu����hzvZ@p�k���7�}�qQ<��+Y�}�?����{[�E��h���Z��O�����q��*�@�or\I��D�ճSH�a(+�m�П�LX����ӧi���$�='��������s����S&dl�;��RS�p:u�f՗{6�G1�N��}2:-Sq<���:8�$�Ɉ���]|I��]�2Y�Ӕ��b7�%wwp�ϟD`���un+\�? ���S��%�i2�K��NE��uy�s���  �<�_������U�n���� ԙ�	v��sY@��&�8ן0vƆ�F���H�C�N_�f0@��4M.��>LjI��YC����BP@G�.�b�H�=G�E�l�f-��nM���N)y]�+
	������}.ܠ�I9�����Y�5�:�pU��^���fc�\��� VpPu����3*�T���rm��-{�?�
jp�RaUx6����v�����h��K�8���ʓ��k?#�C��c2bt}��/+b��99��F\5�HK��]��m�V�n��u�ϊ�5A.E�}��&����H�Χ�S��J����L|�,^�s,�pr��,$�	�'�B炉��;�wl_;�$�K+�7�2�ӧ��և�8��La]qp�~�,��g|�#���}"�j�Ҟ��g|�BH�~w�W�Lz�	T����xo%�*i�����lk��9�V�f�u搏���"�� 70H�ryON��b�sI�^Kx�9V\���$\1�k�����U��$]����N,�Y�ɯ��{�,��#,�D'�!IS�	��䱲��d�i�a$�p q�̹� $�O���fl �t&TB/ħ<5�zMtJ:]��-��%�ѽ�W�
��?.ښ��?_�<�ch��{���9	����-I�9���OI^`XO�������nm��ZG��x-Z�	Y����*[V?Z|�E�� ]%摭a[ uxG^�z�m�f~��_�UF��T<	g����_�O��������"
rK�X"�����;�S"�y�p_���֐ϕy �Φ�t�I�ru�o&�kZ�Ko�N�_ ��,��(�R;�+S��J4��.�2g�:?��+B�pMOKx�ʱ�*���Nv�Z��;"��X#/�n�}a�&J�#��HB
'%�d�����-x>5d�����U�<B�KPW�m�<��*�����R5�Oռ�*̣b_�%��9�CNz3z/q�P�U���:�Ա�Y�.�Jtv��[B�xQ��M N��fY�7��j!xw�4�ϝ'q2p+LQ�T$����%��K��1��!d�߭���l��,�vuB4��:)�[ao%{Q�v{qÚ�AC��/�G��!]���K�PWW    ��MWZ�붔�7�B�["�6D�p������{��}"uf��zN#�X�H��npd�n-q��DGV��Ը�y���zQ�q�I��D �;m�D��t��𩭤b&D]f�Ñ��n��ղLY�[���c@�%��� CD�^�k��Ne�d�CC�ے۶2\�&0z�G�V\�@x��	�(��K Y\�0x�IڷX� yg8"�8J ����Y7�=�r�ȋ�ʷM;��qI�o�d�	C?V���ZQ��$��,1��U;�oyjp��G7Fgsu��C:'�l�a��g�������Q�/��r��/���$�'TA�C��dy�H=�����~�uBn��Y�ܒHz_!�`��#
q��	`���`���r�y�r�������\,
��D�
�SW�#*�T��
y4~=\#P�� I�q&�F��$T8p]���nm�Һ�o��J��jQ(2tF�jj8����5�POd���
sSU�![}�	�19���"�?ֵ%VZ[�:[Y�?W��� ��_M��[��;�J��/?�$����ONN�o_}W���h�{����X^
�3�0�V�*��WɃY�z�|,D4սU�[�uŰ������hPZ��)x���o
C����f���-O�/�����.S�r�x�Y2F�{��jP��:����Ӟl�\�Q�)���IB�(y�Ƅd		�4�b�8�2Y߶���8ӈ=�K,���$��U��h)��xXh�yފ��!2uP���d��bz��Y�2�y��-�:��|�c�lG�J�o��]�y��o��	~c�v�������@��h?E�)��~J�S�~*zY�4X�H�Hs�z#U�a��&ՁJ�Lξ ?	^r\�L�S��ѿ���̓16+���
�#�r���%YyY<���>����Lw�0�%c�O��Ć�0�V�x�7�5A�m��Cf;���|���^r)�.m�KQYj�Aj���PE���+��8J��R��hR���F��.�Of�Y1�2Β���̾>S�o�V�KT.����L[��p��w�z�i�r'?۬����ߌ^C �
8kF_�^C	�.K�s�;d!ӫ�ޱ��e�ܙ�~� PִU!�5�	��p�Mοz�kQ�|<�SU���"(0>��rg���ѝ��g�.˒9��v�:)NH,��9@Er���\���8�qRw@J�������e�lɚ<Hn�I�q�BΉ�:?����]��r��4g���P�(}i0��z�y˵�h��y���<�Cʦ�T�,Mθ���rn�]]�\IWBpƝ`����ї������ޚ���/da�����I��x�n
���K-��+ZG��l�!��+�7;n��TI�uP#R�iC�TU�\(���ZQU�S�������~oѭw�"ZE�t�/Rg��*'�G��K�n}���u�Q��8��{\�8/i��e���P1��q��d�E�C���A��>c��21���I�D��u�m^/?����\��!g~8�P��'̐�&F�̤�3�r[��y��
E��D�5��	�=�\��]����elϊ[��kg� �ed}"6͌���Z[Ǯ`��o�8�di�h���*>������|_�͸(�ř��њ�S#|�o����0�*�	�Sҏ��#I��ق.�-#����U��y���ۨV�;�������֕�Jd_����]���u����y���m�?]j�.[��<��g��B5Zv�8�5s��D��Nh��#����SEI���ӿ>���;��ntQ�+T�37�[X*�?^����c�}S�j�tpU����3Hݏ�X <S�ŧ�������*@JVMI*L���Ԭ�/sK�����P/�(��<�Art��ʚ=R\����{,�|�nͶvʑ�eA���QY �B�	�HF��P)�f@�7���ih�{�AfҾ�`o��۟nLZ����%���&�fb3ߵ�`������nD|�X�F�E����pPR���U$\�u;�����kt"�K��r[ɻ�Z�vq��1��ek�Ú,�Rv��zXƌ��K�ւhH���ᐺ/���?���Y����$�l���;�4�����,��1�Nu���_~��|K�V��"rj�/�ϲ6u�u�o��'�r8)3+]d������a�<�#�\4���s�׷mP���f�<Sw��Bx��sPdU��ǫ�7V�W�-�z�:��Y2�5zQ���x���lI=+��E,���}`�+�s�'�]�j������K���e��έ�f6N��r�Q̹����W�<�UG��e�(w˗v�st6�ZZ	|�[����a�����y�w�@�YAv��Q�6l�;m#ݱ)� ����9]�/�"�~����m�(E�>��J��+-��x�����qE�j��kbb��+-	�F@���.��H�Bm�Kǝ ��w=�8��ok�K�k;g��ض�2�{J5N�A_�w����6s(`�،�rb5�~.�c��T�(� /�G�{���M�����]�b�p�.��*`Y�`�;��+�F�)�IX@'C~;��l���=In�a�߾;������Э�C��l��0:dl���3@WH����ojdYM��@�ko���?C<������~p�چx<Dm��*����eX�Py<�����\^!�p�n�s�� w�m����3��ze�t�(N�����o�q9�! !%���m- v�;�!�}�j-�@t�p:����>WU��w\g����Yt|�nh��	Hr�$���>���ޏ�ٻ;����R-��=d_�X�*K�Ѕ?y�Y~�/�O2�(��C���^Xz
g��!��ō���L8r莯��� 	y��Ӯwu5?Q�I"^Q�L��vBW~ٙ"\��+�|Ŭ�b$�:�Y;�D�4`�_l2��� &#|%�C(C�p7��^���IQ��N�q 'T��{f>�of3wv_Gp�4QO�=C]�-��+\?����y���t�>��D��X��oN ����m�Y֡ �㪺./D��bN��N;tTڡ��Y��ӛ�]��Cp��c��B7{��ҵVb�m����m�x��Sh�r�sA�e-��[`D���8>:x	K3w�g|��'+���$���&�+X8��PPO�P�ζ���5�����ۗ�\����-��tݒ������Л���L��;�fVW����m�!1$Ҟ&sz�{1R��?�ѫ�QL���,�.��j�Vu��'��v���]lOLt��-?:��[Y�I"P���OPy�����v�f7�6��õ~g�q��:��*�8���� ��j��SI|�O; ����ʑ<T��-U�ؒ�$�dxrx��X�$�gc�p#2��k%}Asvtu`�c�gQ�m�! Z�}�m/>�`��9s'��>�a���g�n�w0ٻ:�����&.����'�EЧLQ�k�������3[9�H�_����-����!r��aN�j�Ȅ��Pn�!ۼ�gC�]���u�$Y�+���sx�ܟN�3�8���Y/��ߘ��9���V|��8�x9�##&<�l�jw�٣A���W�K6��_+�!�s�O�wzu�=ʏ�����9�2Y��$˝]O�c���A�A�U7�d�y�2�tZJq��+�t#���';C�!`��>JW{�R�j�4�;��4���U�3�<$Wk��'"��)����(��������`q�["���݀�� ��om6?]
�����j�ͬ��^���X��/����z(S�!�l�si�ʪS���H	v�v��N���k�����ɌI[��\Z�߷^1�lƖ.�!G�S٢bVb�Q������&r��N?~J.���>a�V�K��$�(vҹ�!_���ڸ��BZ[��?ZI�vP��Y`�NH/����M�^-J�0�=^Ly��?��U�DDR� b��i�>��X�r\��$�£N�����TX��@=&�_��!k�'���)J�#F5�����ɻ���r,����L�ޟ}:����B�����W�c� �  ���@�pe7�%m��S�P�U�]�<���i-�߾�kYi�G�s{�d����X�٥#ʗ�j>�
��g�\���y��p�,*�s���p�o*S,���LL�q�yVsq7p��k
�,�t2��Ut�k�n:�Ob�D74���1��Zz��3� ��0��1��<�f�B/�&�F�OB�����]�TL�$���.ĝ�X/�pH��v�d����X���@ѩ������Yzj��P�J)T�d`��}/��U�-s�E���Q7�U^�D��'4����%���O2��;m�ww:���d�xr6��kc�R�t
��F|+!�Q�C<�(��%2a2�f�m� ��� �w1G���/�� �����1�ă�Z������0ok��ٝ���zTߧ�=}�����W/�~�c�. ��s邁�UY�c�y<��=�N$ee�m���%�q��Gt���W����y�������7g�D�z��J��:xzC� ���o/�9PfY�0����y�̺���| �\�2�D�?_�<�gmt/t�����J�u��"&m����6�Fc⦹y�Q��N�d+�tj�0p�g�>Ѭ�hƫ��ޗe6NN�v�:�kғ�Z��6�T�$���#r�B�W��N�n$�q��n2%�����ʊ*/F�0+}�N��ǣ�\���լ�]&O?�+Lz2B��KMV�6g3?�_���W\���w�%�[���Lz�2)z[�s�+���ZrI�ӀNN21��cX���&J�j������N� ;��6w$'�HЫ��
uUQ�W\��a~J��/F��ʸb�m� �w ��Q��Rͯ���O'��vREv`I�/̞��X�Z"��0y���d����o#v֤ʸ���"�����$Cd���R.IK���xpڒ)����*��n.��=�R�x��A�s{��:�+F߀,fF�`�+����������0��Wo�!u�h�f�\������E��#�N��e�W�C�r�(��W�!�n��/�	�?�=�Cyd��>���))�6�g��q���g��PK�,�K��Z;�b����k�C�B�c �.���Z�B{��:ZT��M(wx�z*ZT@�6��jt�y.:��y��O5�h�Ѡ��䡢���3L��6�/sߛ���ɥ��	_�~�k:�Z��� ����:�3¾6Ͷ���#m��G�d�jPL`���x�>��kvh�x}צ�,���x}���\�Q�Ɯ�RYpyS��h�?���ˇP���ۮb����~��뇪�!mތn�ZuF���K���A��o�l;�Uۥ�>6�i:��v�j.Z~76-GW$w�o����~mo�F�Z�"�d�c7Q�!�cv�;߀	��vF�3Z��о�tݫn�xѸ�i`s���ՅO�v�ց�"^�M���C#�y��莩p� �2��j:�0�����P��Q��v�	�����7܆)��蜉����""k�|7�ViLBઑn�o\R���LBO"�m�������~���0ߺ/4��EN��b�4�kk�r�^uQ��i��6��bEY��~��y�.�a����b��+/5��=�U��|A��T�x�m�M����ሥ
�$2��T;Ѯ��l��s�j�B��/p����VJ�A."�`����^�w
u��eY���c�4
�+�����]����<|�A5V��VO
08� ��� ��Exo��Ő.G���ҍ�fO��׋Su��w�y���d��{�O�@�����V���+R�xZV䊐�D�cbɑ��E���;�
�������	e8��A�u���B��F�Fu���i�p߲k�ۭp��D��X�H����<��y��ѹC쀆�#��v��"W�cȱ�������k9{����cD���*}�v������B�m�G�Wz7���կ��{�D�����ܖ;m(�"x��d�k���n�l9ujy��Q��;5p��S�-T���E�|�������:�z�v��^�,��)��)Ј����x��U���S�	'6m��3#}�fע����m틃a�p֑di�t����ֽm#������Xb��E��=�G��u�����2��8�4q���!��O���mg��YG����Wu�U�0�Ow�&e����1�� IBH)����ts���d�˔���v����/��������J#��!��r�Ć�٦��02��d��ѫ8"��^��؈;�į�_�-o2��}*3���6t��>��/h�Ŵ���ŵ�k��	PE��^���J���Q4]jS�ߚ/����p7򣺚;Ld� a��X𗊊X�c��'m*����_3����F�4<3�c𔴻����E9��^w�V�h_-��ߡ����WĆ㢚���K��;�Q�n�ېN�Fg�h��vA�}ܲ����J�\���ʩ�3�˭�<��B���̴m�A�k�����B]����i��3�\Y�
�!����o8���=����1�
k�6�ſC���S|�\�ף�'
;�tM���D���?��*% k։�$�vw��d��w$��Di�A�6X ���J�w��/�O^�7$wX1�je_��j��{|���:`���os�Ng��:�/)w����s�~���Eձ��8z�U���*wT����fDtB�"|ϧ.�^_��CJk�{b �7-3*����ϰ�":��`p�����-���(j6_>H�	��#�a��B��!Л�����o��Q�ʆ	a@�;ي�Q�@���۶���˸I��CF#��A�9�/�!3x�z�\û�U��<�x��8���vԋ5*�%����:H�y�|Vx�����O|�*�_�fv��8��j��.��=Cq��o>����!���W�$� =͛K�צ6� V�an�O
G4�J��؍�����D�F���?]0O&O��:K�69o��M~^j�c������q���5<���a�[�����㹜�o.�=���fb����ptF��!q�A�ǋ���㖻
6��Ƨ4/��� h��U�U�{NR�pT���D��,{�с������?M/.'�R���[���8�7J����]"��G����'����	��s�>yD�,çr:L]�#�c��@&���$b����Q����k���Sk)o:{9�1#UD�D�������Zѣ2�ԓٿ��̍��3��Eل�ݜG�`��9I`����xq��t�����x��mԌ�2|iex��J�贈��rMN|4��^��.��$K�ʙ,���AKfta�M�Pxn���OV4�g��� 3!7B��\����������a�[
[�ʿ7�Ç��KA�ߧ?�6�0����P��/�X��D�ۃ�+� ���y���}�_�]]D�u1��Eչ�Q%*�L7
�r�xׯʊ޲����<;�n���X3�5����w&�
$V1���o���?��l��     