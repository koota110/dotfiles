Vim�UnDo� �9����߆{��m�zC'^"�#�P�����īA-                    
       
   
   
    ^�a)    _�                             ����                                                                                                                                                                                                                                                                                                                                                             ^�`�     �                	"github.com/jinzhu/gorm"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^�`�     �               )5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^�`�     �                5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             ^�`�     �      
         	db *gorm.DB5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             ^�a     �      
         	db *xorm.Engine5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                             ^�a     �               7func NewLETChangeType(db *gorm.DB) repo.LETChangeType {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^�a     �               ,func NewLETChangeType() repo.LETChangeType {5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             ^�a     �               	return &letChangeType{db: db}5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             ^�a      �               	return &letChangeType{}5�_�   	               
           ����                                                                                                                                                                                                                                                                                                                                                             ^�a(    �                      package infra   import (   .	"github.com/egxp/let-mss-api/api/domain/repo"   "xorm.io/xorm"   )       type letChangeType struct {   	engine *xorm.Engine   }       ?func NewLETChangeType(engine *xorm.Engine) repo.LETChangeType {   &	return &letChangeType{engine: engine}   }       %func (u *letChangeType) Get() error {   	return nil   }5��