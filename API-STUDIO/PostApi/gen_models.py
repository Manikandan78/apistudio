from sqlalchemy import (create_engine, Column, Date, DateTime,
                        Integer, String, Boolean, ForeignKey,
                        Float, func, Time, LargeBinary, Text)
from database import Base
from sqlalchemy.orm import relationship
import rule_engine
import datetime
import uuid
from sqlalchemy.orm import validates
from sqlalchemy.orm import relationship


class ApiSysConfig(Base):
    __tablename__ = "api_sys_config"

    id = Column(Integer, primary_key=True, index=True, unique=True)
    config_name = Column(String)


# ----- GENERATED MODELS -----
class ApiStudioAppGroup(Base):
    __tablename__ = "api_studio_app_group"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    name = Column(String)
    group_id = Column(String)
    child = Column(Boolean)
    parent_id = Column(Integer, nullable=True)
    api_studio_app_group_media = relationship('ApiStudioAppGroupMedia', back_populates='api_studio_app_group', cascade='all, delete-orphan')
    api_studio_app_group_post = relationship('ApiStudioAppGroupPost', back_populates='api_studio_app_group', cascade='all, delete-orphan')
    api_studio_app_group_post_reaction = relationship('ApiStudioAppGroupPostReaction', back_populates='api_studio_app_group', cascade='all, delete-orphan')



class ApiStudioAppGroupMedia(Base):
    __tablename__ = "api_studio_app_group_media"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('api_studio_app_group.psk_id'))
    api_studio_app_group = relationship('ApiStudioAppGroup', back_populates='api_studio_app_group_media')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    attachment_content = Column(Text)
    file_blob = Column(LargeBinary)
    file_mime = Column(String)
    file_name = Column(String)
    file_path = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)


class ApiStudioAppGroupPost(Base):
    __tablename__ = "api_studio_app_group_post"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('api_studio_app_group.psk_id'))
    api_studio_app_group = relationship('ApiStudioAppGroup', back_populates='api_studio_app_group_post')
    post_reaction = relationship('ApiStudioAppGroupPostReaction', back_populates='post')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    post_comment = Column(String)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    file_blob = Column(LargeBinary)
    file_mime = Column(String)
    file_name = Column(String)
    file_path = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)


class ApiStudioAppGroupPostReaction(Base):
    __tablename__ = "api_studio_app_group_post_reaction"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('api_studio_app_group.psk_id'))
    api_studio_app_group = relationship('ApiStudioAppGroup', back_populates='api_studio_app_group_post_reaction')
    post_psk_id = Column(Integer, ForeignKey('api_studio_app_group_post.psk_id'))
    post = relationship('ApiStudioAppGroupPost', back_populates='post_reaction')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    reaction = Column(String)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)




class ApiStudioAppName(Base):
    __tablename__ = "api_studio_app_name"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    app_id = Column(String)
    used = Column(Boolean)
    type = Column(String, nullable=True)
    name = Column(String)
    api_studio_app_group_id = Column(Integer, ForeignKey('api_studio_app_group.psk_id'))



class ApiStudioAppPasswordResetTokens(Base):
    __tablename__ = "api_studio_app_password_reset_tokens"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    username = Column(String)
    token = Column(String)
    token_expiry = Column(Integer)
    used = Column(Boolean)



class ApiStudioAppWebconfig(Base):
    __tablename__ = "api_studio_app_webconfig"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    favicon_name = Column(String, nullable=False)
    app_name = Column(String)
    api_studio_app_webconfig_media = relationship('ApiStudioAppWebconfigMedia', back_populates='api_studio_app_webconfig', cascade='all, delete-orphan')



class ApiStudioAppWebconfigMedia(Base):
    __tablename__ = "api_studio_app_webconfig_media"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('api_studio_app_webconfig.psk_id'))
    api_studio_app_webconfig = relationship('ApiStudioAppWebconfig', back_populates='api_studio_app_webconfig_media')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    attachment_content = Column(Text)
    file_blob = Column(LargeBinary)
    file_mime = Column(String)
    file_name = Column(String)
    file_path = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)


class Asa02010101(Base):
    __tablename__ = "asa0201_01_01"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    user_role_privilege = Column(Text, nullable=False)
    active = Column(String)
    user_role = Column(String, unique=True, nullable=False)



class Asa02020101(Base):
    __tablename__ = "asa0202_01_01"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    menu_name = Column(String, unique=True, nullable=False)
    menu_psk_uid = Column(String, nullable=True)
    menu_icon = Column(String, nullable=True)
    menu_href = Column(String, nullable=True)
    menu_psk_id = Column(Integer, nullable=True)
    menu_order = Column(Integer, nullable=True)
    active = Column(String, nullable=True)
    menu_uid = Column(String, unique=True, nullable=False)
    menu_parent_id = Column(Integer, nullable=True)
    menu_code = Column(Text, nullable=True)
    menu_type = Column(String, nullable=True)
    menu_app_bar = Column(String, nullable=True)
    menu_level = Column(Integer, nullable=True)
    string = Column(String)
    asa0202_01_01_media = relationship('Asa02020101Media', back_populates='asa0202_01_01', cascade='all, delete-orphan')



class Asa02020101Media(Base):
    __tablename__ = "asa0202_01_01_media"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('asa0202_01_01.psk_id'))
    asa0202_01_01 = relationship('Asa02020101', back_populates='asa0202_01_01_media')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    attachment_content = Column(Text)
    file_blob = Column(LargeBinary)
    file_mime = Column(String)
    file_name = Column(String)
    file_path = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)


class Asa02030101(Base):
    __tablename__ = "asa0203_01_01"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    menu_privilege_start_date = Column(Date)
    menu_privilege_end_date = Column(Date)
    active = Column(String, nullable=True)
    menu_privilege_name = Column(String, unique=True, nullable=False)

    @validates('menu_privilege_start_date')
    def validate_menu_privilege_start_date(self, key, menu_privilege_start_date):
        if not rule_engine.is_valid_date(menu_privilege_start_date, ('%d-%m-%Y', '%Y-%m-%d')):
            raise ValueError(f"Invalid date format: {menu_privilege_start_date}. Valid Format is DD-MM-YYYY or YYYY-MM-DD")
        return menu_privilege_start_date

    @validates('menu_privilege_end_date')
    def validate_menu_privilege_end_date(self, key, menu_privilege_end_date):
        if not rule_engine.is_valid_date(menu_privilege_end_date, ('%d-%m-%Y', '%Y-%m-%d')):
            raise ValueError(f"Invalid date format: {menu_privilege_end_date}. Valid Format is DD-MM-YYYY or YYYY-MM-DD")
        return menu_privilege_end_date



class Asa02040101(Base):
    __tablename__ = "asa0204_01_01"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    last_name = Column(String, nullable=True)
    username = Column(String, unique=True, nullable=False)
    email = Column(String, unique=True, nullable=False)
    reporting_to = Column(String, nullable=True)
    password = Column(String, nullable=False)
    user_roles = Column(Text, nullable=False)
    user_type = Column(Text, nullable=False)
    home_menu = Column(Text, nullable=True)
    active = Column(Boolean)
    first_name = Column(String, nullable=False)
    asa0204_01_01_media = relationship('Asa02040101Media', back_populates='asa0204_01_01', cascade='all, delete-orphan')
    asa0204_01_01_post = relationship('Asa02040101Post', back_populates='asa0204_01_01', cascade='all, delete-orphan')
    asa0204_01_01_post_reaction = relationship('Asa02040101PostReaction', back_populates='asa0204_01_01', cascade='all, delete-orphan')

    @validates('email')
    def validate_email(self, key, email):
        if not rule_engine.is_valid_email(email):
            raise ValueError(f"Invalid email address: {email}")
        return email



class Asa02040101Media(Base):
    __tablename__ = "asa0204_01_01_media"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('asa0204_01_01.psk_id'))
    asa0204_01_01 = relationship('Asa02040101', back_populates='asa0204_01_01_media')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    attachment_content = Column(Text)
    file_blob = Column(LargeBinary)
    file_mime = Column(String)
    file_name = Column(String)
    file_path = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)


class Asa02040101Post(Base):
    __tablename__ = "asa0204_01_01_post"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('asa0204_01_01.psk_id'))
    asa0204_01_01 = relationship('Asa02040101', back_populates='asa0204_01_01_post')
    post_reaction = relationship('Asa02040101PostReaction', back_populates='post')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    post_comment = Column(String)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    file_blob = Column(LargeBinary)
    file_mime = Column(String)
    file_name = Column(String)
    file_path = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)


class Asa02040101PostReaction(Base):
    __tablename__ = "asa0204_01_01_post_reaction"

    psk_id = Column(Integer, primary_key=True, index=True)
    psk_uid = Column(String, default=uuid.uuid4)
    parent_psk_id = Column(Integer, ForeignKey('asa0204_01_01.psk_id'))
    asa0204_01_01 = relationship('Asa02040101', back_populates='asa0204_01_01_post_reaction')
    post_psk_id = Column(Integer, ForeignKey('asa0204_01_01_post.psk_id'))
    post = relationship('Asa02040101Post', back_populates='post_reaction')
    app_id = Column(String)
    user_id = Column(String)
    row_order = Column(Integer)
    reaction = Column(String)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, default=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)




class Asa02050101(Base):
    __tablename__ = "asa0205_01_01"

    psk_id = Column(Integer, primary_key=True, index=True)
    transaction_id = Column(Integer)
    transaction_remarks = Column(Text)
    api_id = Column(String)
    app_psk_id = Column(Integer)
    app_uid = Column(String)
    psk_uid = Column(String, default=uuid.uuid4)
    user_id = Column(Integer)
    created_by = Column(String)
    created_on = Column(DateTime, default=func.now())
    updated_by = Column(String)
    updated_on = Column(DateTime, onupdate=func.now())
    cancel_by = Column(String)
    cancel_on = Column(DateTime)
    cancel_status = Column(String)
    cancel_remarks = Column(String)
    approval_level_1 = Column(Integer)
    approval_level_2 = Column(Integer)
    approval_remarks = Column(Integer)
    workflow_id = Column(String)
    workflow_role = Column(String)
    row_order = Column(Integer)
    gis_latitude = Column(Float)
    gis_longitude = Column(Float)
    cdn_location = Column(String)
    menu_privilege = Column(Text, nullable=False)
    menu_items = Column(Text, nullable=False)
    user_privilege_name = Column(String, nullable=False)



