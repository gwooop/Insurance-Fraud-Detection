from django.db import models

# Create your models here.
class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class ClaimData(models.Model):
    # cust_data = models.ForeignKey(CustData, related_name='cust_id')
    id = models.IntegerField(db_column='ID', blank=False, null=False, primary_key=True)
    cust_id = models.IntegerField(db_column='CUST_ID', blank=True, null=True)  # Field name made lowercase.
    poly_no = models.IntegerField(db_column='POLY_NO', blank=True, null=True)  # Field name made lowercase.
    acci_dvsn = models.IntegerField(db_column='ACCI_DVSN', blank=True, null=True)  # Field name made lowercase.
    dmnd_resn_code = models.IntegerField(db_column='DMND_RESN_CODE', blank=True, null=True)  # Field name made lowercase.
    vlid_hosp_otda = models.IntegerField(db_column='VLID_HOSP_OTDA', blank=True, null=True)  # Field name made lowercase.
    hosp_code = models.FloatField(db_column='HOSP_CODE', blank=True, null=True)  # Field name made lowercase.
    chme_lice_no = models.FloatField(db_column='CHME_LICE_NO', blank=True, null=True)  # Field name made lowercase.
    heed_hosp_yn = models.CharField(db_column='HEED_HOSP_YN', max_length=1, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'claim_data'

    def __str__(self):
        return "청구번호: " + str(self.poly_no)


class CustData(models.Model):
    # id = models.IntegerField(db_column='ID', blank=False, null=False, primary_key=True)
    cust_id = models.IntegerField(db_column='CUST_ID', blank=False, null=False, primary_key=True)  # Field name made lowercase.
    divided_set = models.IntegerField(db_column='DIVIDED_SET', blank=False, null=False)  # Field name made lowercase.
    siu_cust_yn = models.CharField(db_column='SIU_CUST_YN', max_length=1, blank=False, null=True)  # Field name made lowercase.
    sex = models.IntegerField(db_column='SEX', blank=False, null=False)  # Field name made lowercase.
    age = models.IntegerField(db_column='AGE', blank=False, null=False)  # Field name made lowercase.
    resi_cost = models.IntegerField(db_column='RESI_COST', blank=False, null=False)  # Field name made lowercase.
    resi_type_code = models.FloatField(db_column='RESI_TYPE_CODE', blank=False, null=False)  # Field name made lowercase.
    ctpr = models.CharField(db_column='CTPR', max_length=20, blank=False, null=False)  # Field name made lowercase.
    occp_grp_1 = models.CharField(db_column='OCCP_GRP_1', max_length=50, blank=False, null=False)  # Field name made lowercase.
    totalprem = models.FloatField(db_column='TOTALPREM', blank=False, null=False)  # Field name made lowercase.
    wedd_yn = models.CharField(db_column='WEDD_YN', max_length=1, blank=False, null=False)  # Field name made lowercase.
    mate_occp_grp_1 = models.CharField(db_column='MATE_OCCP_GRP_1', max_length=30, blank=True, null=False)  # Field name made lowercase.
    chld_cnt = models.FloatField(db_column='CHLD_CNT', blank=True, null=False)  # Field name made lowercase.
    ltbn_chld_age = models.IntegerField(db_column='LTBN_CHLD_AGE', blank=True, null=False)  # Field name made lowercase.
    max_prm = models.FloatField(db_column='MAX_PRM', blank=True, null=False)  # Field name made lowercase.
    cust_incm = models.FloatField(db_column='CUST_INCM', blank=True, null=False)  # Field name made lowercase.
    rcbase_hshd_incm = models.IntegerField(db_column='RCBASE_HSHD_INCM', blank=True, null=False)  # Field name made lowercase.
    jpbase_hshd_incm = models.FloatField(db_column='JPBASE_HSHD_INCM', blank=True, null=False)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cust_data'

    def __str__(self):
        return "고객번호: " + str(self.cust_id)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
