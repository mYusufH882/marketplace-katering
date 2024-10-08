PGDMP  	                    |            marketplace_katering    14.5    16.0 [    f           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            g           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            h           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            i           1262    61143    marketplace_katering    DATABASE     �   CREATE DATABASE marketplace_katering WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 $   DROP DATABASE marketplace_katering;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                Yusuf    false            j           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   Yusuf    false    4            �            1259    61842 
   categories    TABLE     �   CREATE TABLE public.categories (
    id bigint NOT NULL,
    category_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false    4            �            1259    61841    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    221    4            k           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    220            �            1259    61809    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false    4            �            1259    61808    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    4    215            l           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    214            �            1259    61873    invoices    TABLE     �  CREATE TABLE public.invoices (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    issued_date timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    due_date timestamp(0) without time zone,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    invoice_code character varying(255) NOT NULL,
    CONSTRAINT invoices_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'cancelled'::character varying])::text[])))
);
    DROP TABLE public.invoices;
       public         heap    postgres    false    4            �            1259    61872    invoices_id_seq    SEQUENCE     x   CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.invoices_id_seq;
       public          postgres    false    4    225            m           0    0    invoices_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;
          public          postgres    false    224            �            1259    61833 	   locations    TABLE     �   CREATE TABLE public.locations (
    id bigint NOT NULL,
    location_name character varying(255) NOT NULL,
    address text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.locations;
       public         heap    postgres    false    4            �            1259    61832    locations_id_seq    SEQUENCE     y   CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    219    4            n           0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    218            �            1259    61849    menus    TABLE     �  CREATE TABLE public.menus (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category_id bigint NOT NULL,
    location_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    image character varying(255),
    price numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.menus;
       public         heap    postgres    false    4            �            1259    61848    menus_id_seq    SEQUENCE     u   CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.menus_id_seq;
       public          postgres    false    223    4            o           0    0    menus_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;
          public          postgres    false    222            �            1259    61145 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false    4            �            1259    61144    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    210    4            p           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    209            �            1259    61908    order_items    TABLE       CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    menu_id bigint NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.order_items;
       public         heap    postgres    false    4            �            1259    61907    order_items_id_seq    SEQUENCE     {   CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_items_id_seq;
       public          postgres    false    4    229            q           0    0    order_items_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;
          public          postgres    false    228            �            1259    61888    orders    TABLE     �  CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    invoice_id bigint,
    order_date timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    delivery_date date NOT NULL,
    status character varying(255) DEFAULT 'pending'::character varying NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'confirmed'::character varying, 'completed'::character varying, 'cancelled'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap    postgres    false    4            �            1259    61887    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    4    227            r           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    226            �            1259    61801    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false    4            �            1259    61821    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false    4            �            1259    61820    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    217    4            s           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    216            �            1259    61790    users    TABLE     T  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'customer'::character varying NOT NULL,
    address character varying(255),
    company_name character varying(255),
    phone_number character varying(255),
    description text,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    61789    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    4    212            t           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    211            �           2604    61845    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    61812    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    61876    invoices id    DEFAULT     j   ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);
 :   ALTER TABLE public.invoices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    61836    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    61852    menus id    DEFAULT     d   ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);
 7   ALTER TABLE public.menus ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    61148    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    61911    order_items id    DEFAULT     p   ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);
 =   ALTER TABLE public.order_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    61891 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    61824    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    61793    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            [          0    61842 
   categories 
   TABLE DATA           O   COPY public.categories (id, category_name, created_at, updated_at) FROM stdin;
    public          postgres    false    221   �q       U          0    61809    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    215   �r       _          0    61873    invoices 
   TABLE DATA           �   COPY public.invoices (id, user_id, total_amount, issued_date, due_date, status, created_at, updated_at, invoice_code) FROM stdin;
    public          postgres    false    225   �r       Y          0    61833 	   locations 
   TABLE DATA           W   COPY public.locations (id, location_name, address, created_at, updated_at) FROM stdin;
    public          postgres    false    219   �r       ]          0    61849    menus 
   TABLE DATA              COPY public.menus (id, user_id, category_id, location_id, name, description, image, price, created_at, updated_at) FROM stdin;
    public          postgres    false    223   xt       P          0    61145 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    210   du       c          0    61908    order_items 
   TABLE DATA           e   COPY public.order_items (id, order_id, menu_id, quantity, price, created_at, updated_at) FROM stdin;
    public          postgres    false    229   Ov       a          0    61888    orders 
   TABLE DATA           �   COPY public.orders (id, user_id, invoice_id, order_date, delivery_date, status, total_amount, created_at, updated_at) FROM stdin;
    public          postgres    false    227   �v       S          0    61801    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    213   �v       W          0    61821    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    217   �v       R          0    61790    users 
   TABLE DATA           �   COPY public.users (id, name, email, email_verified_at, password, role, address, company_name, phone_number, description, remember_token, created_at, updated_at) FROM stdin;
    public          postgres    false    212   �w       u           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 10, true);
          public          postgres    false    220            v           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    214            w           0    0    invoices_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.invoices_id_seq', 2, true);
          public          postgres    false    224            x           0    0    locations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.locations_id_seq', 33, true);
          public          postgres    false    218            y           0    0    menus_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.menus_id_seq', 4, true);
          public          postgres    false    222            z           0    0    migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.migrations_id_seq', 57, true);
          public          postgres    false    209            {           0    0    order_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_items_id_seq', 1, true);
          public          postgres    false    228            |           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 1, true);
          public          postgres    false    226            }           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 59, true);
          public          postgres    false    216            ~           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    211            �           2606    61847    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    221            �           2606    61817    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    215            �           2606    61819 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    215            �           2606    61881    invoices invoices_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.invoices DROP CONSTRAINT invoices_pkey;
       public            postgres    false    225            �           2606    61840    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    219            �           2606    61856    menus menus_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_pkey;
       public            postgres    false    223            �           2606    61150    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    210            �           2606    61913    order_items order_items_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public            postgres    false    229            �           2606    61896    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    227            �           2606    61807 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    213            �           2606    61828 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    217            �           2606    61831 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    217            �           2606    61800    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    212            �           2606    61798    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �           1259    61829 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    217    217            �           2606    61882 !   invoices invoices_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.invoices DROP CONSTRAINT invoices_user_id_foreign;
       public          postgres    false    3236    212    225            �           2606    61862    menus menus_category_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_category_id_foreign;
       public          postgres    false    223    221    3251            �           2606    61867    menus menus_location_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_location_id_foreign FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_location_id_foreign;
       public          postgres    false    3249    223    219            �           2606    61857    menus menus_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_user_id_foreign;
       public          postgres    false    212    223    3236            �           2606    61919 '   order_items order_items_menu_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_menu_id_foreign;
       public          postgres    false    229    3253    223            �           2606    61914 (   order_items order_items_order_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_order_id_foreign;
       public          postgres    false    229    227    3257            �           2606    61902     orders orders_invoice_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_invoice_id_foreign FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_invoice_id_foreign;
       public          postgres    false    225    3255    227            �           2606    61897    orders orders_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_user_id_foreign;
       public          postgres    false    212    227    3236            [   �   x�=�M
�0���9�X��VA�.*n�y�iR�&��,�0���*g,8jniԂ�#\�k�gK:xy{A`}���Wt�1BzdXS�A�!�߸�2v����,��Ka،;*!O~Eΰ�+,�����wsV���SH���m�f���O<�      U      x������ � �      _   L   x�3�4�445 =N##]K]3s++cc���1B� 5/%3/�zt1K3]#]G�N]�0g�=... h4�      Y   j  x��R�j�@}^�b>@�5�$�& �Mb�K_ƺ�Ew'����}g��/�BAd=̹�YӅؓ�A�kec�a��!�~@æ�ΐ�<��O"#K�o��=Ű�V�h� qA��i�4s�E�ơ�³PxŐa��x����^D���Y�$�H+Y�d�Ѭ�4�O�W�A�*���,�C����ExwͳKQ�F{elMCF
É�����ĭ���n+�˰م�l�uXǌ�thb(�E&l��q7�,8�i;_s��Þ�x���,����4?�#��̣(;�9ָ�F^�(���^K���m�r���b�O���,���7��y���ё㛩-9�%�r�Z��F��0ō�A���~&Q}�+�      ]   �   x�mνn�0��پ
� �6i�% h$����.D�q���o��Ъ�{��Ⓚ �W�:mY��ܙ��{1w���Y�v� ��&o�NmVo�̼'�22����g������+YƱ�h]H�8� < �	��2@�
��6��	��-o;;���&/�=�}9
�����mizz��l�E�#q�T��%_my�Hv�.��A��T!��xH?=J�7L�T�      P   �   x�e�Mn� �u8L���?w�4"0�Hi�_��.8,X}�7p8)	H 	ɿC6��L��1Q6��O p�%4�aR�	�Q�ęr��JNkr"9�z7�O�gvt���˯5��7���bf2�rJ�*%�J��h���[t�dj�޴�t�|�sŻ7�o��˳���n��a�|o�gu�Qv;.;��@�
06�|�{�ڃ�2�mC����C)�qB��V��      c   2   x�3�4�4bCS0�30�4202�5��50S00�21�26�&����� k)7      a   ;   x�3�4A#]K]3s++cc$1΂Լ�̼tNCS0�30 �.�����  ��      S      x������ � �      W   �   x�m���0 g�+PG�"�mwc6&��4�T�U+���閻��mK龖�)=�������K_ ���y�]�nca�����xǂ��`(u��6W�3���<�!=~4nD1���4M�5�.J�/��'f      R   �   x�}���0 E��+X���&�| b|D��(
�׫�1�9�n����zYx���-[HDHI��!�k���y���f]X�N�|��c��3_�"V�:w6/�[?�G�#�hmd�Q�������&1���'@|ٔ��^���JYq�]��I�ɵ���)����`���9��*}����(:���O2L�55����!|�AS�     