Vim�UnDo� ���ґ��������L�np�bz��-��aT{�                                      _P�    _�                              ����                                                                                                                                                                                                                                                                                                                                                             _P�    �                  package model       import "time"       %type PolicyForAuthorityGroup struct {   	AuthorityGroupId int64   	PolicyId         int64   ,	CreateDt         time.Time `xorm:"created"`   ,	UpdateDt         time.Time `xorm:"updated"`   }       3func (PolicyForAuthorityGroup) TableName() string {   &	return "t_policy_for_authority_group"   }5��