<template>
    <el-container>
        <el-header>
            <Snav>
                <template v-slot:name>用户信息</template>
            </Snav>
        </el-header>
        <el-main class="main">
            <el-card :class="{ 'folded': !card1, '': card1 }">
                <template #header>
                    <div class="card-header ">
                        <span>基本信息</span>
                        <div class="button">
                            <el-button class="button" text>
                                <el-icon class="el-icon--right" @click="openCard(1)">
                                    <ArrowUp v-if="!card1Ico" />
                                    <ArrowDown v-if="card1Ico" />
                                </el-icon></el-button>
                        </div>
                    </div>

                </template>
                <el-form ref="UserinforuleFormRef" :model="UserinforuleForm" :rules="Userinforules" label-width="90px "
                    :size="formSize" status-icon :label-position="labelPosition">

                    <el-form-item label="证件照" prop="photo">
                        <el-upload class="avatar-uploader" :show-file-list="false" :on-success="handleAvatarSuccess"
                            :before-upload="beforeAvatarUpload" action="Jump" :on-error="retryupdate">
                            <img v-if="resumeinfo.photo" :src="this.$ApiBaseUrl + resumeinfo.photo" class="avatar" />
                            <el-icon v-else class="avatar-uploader-icon">
                                <Plus />
                            </el-icon>
                        </el-upload>
                    </el-form-item>
                    <el-form-item label="姓名" prop="name">
                        <el-input v-model="UserinforuleForm.name" />
                    </el-form-item>

                    <el-form-item label="生日" prop="birth">
                        <el-date-picker v-model="UserinforuleForm.birth" type="date" placeholder="生日" format="YYYY-MM-DD"
                            value-format="YYYY-MM-DD" />
                    </el-form-item>
                    <el-form-item label="邮箱" class="readonly">
                        <el-input v-model="resumeinfo.email" readonly />
                    </el-form-item>
                    <el-form-item label="手机号" class="readonly">
                        <el-input v-model="resumeinfo.phone" readonly />
                    </el-form-item>
                    <el-form-item label="性别">
                        <el-select v-model="UserinforuleForm.genderCode" class="m-2" placeholder="性别">
                            <el-option v-for="key, value in this.$baseData.genderObject" :key="value" :label="key"
                                :value="value" />
                        </el-select>
                    </el-form-item>

                    
                    <el-button type="danger" plain @click="UserinfosubmitForm()">保存</el-button>

                </el-form>
            </el-card>
            <el-card :class="{ 'folded': !card2, '': card2 }" style="margin-top: 15px;">
                <template #header>
                    <div class="card-header ">
                        <span>景点期望</span>
                        <div class="button">
                            <el-button class="button" text>
                                <el-icon class="el-icon--right" @click="openCard(2)">
                                    <ArrowUp v-if="!card2Ico" />
                                    <ArrowDown v-if="card2Ico" />
                                </el-icon></el-button>
                        </div>
                    </div>
                </template>
                <el-form ref="UserresumeruleFormRef" :model="UserresumeruleForm" label-width="90px " :size="formSize"
                    status-icon :label-position="labelPosition">
                    <el-form-item label="景点类型">
                        <el-select v-model="UserresumeruleForm.topic" class="m-2" placeholder="景点类型">
                            <el-option v-for="item in this.$baseData.topic_code" :key="item.name" :label="item.name"
                                :value="item.code" />
                        </el-select>
                    </el-form-item>
                    <el-form-item label="向往城市" class="address">
                        <el-select v-model="UserresumeruleForm.city1" class="m-2" placeholder="城市1">
                            <el-option v-for="item in this.$baseData.city_code" :key="item.name" :label="item.name"
                                :value="item.code" />
                        </el-select>
                        <el-select v-model="UserresumeruleForm.city2" class="m-2" placeholder="城市2">
                            <el-option v-for="item in this.$baseData.city_code" :key="item.name" :label="item.name"
                                :value="item.code" />
                        </el-select>
                        <el-select v-model="UserresumeruleForm.city3" class="m-2" placeholder="城市3">
                            <el-option v-for="item in this.$baseData.city_code" :key="item.name" :label="item.name"
                                :value="item.code" />
                        </el-select>
                    </el-form-item>
    
                    <el-form-item label="预算范围" class="salary">
                        <el-input v-model="UserresumeruleForm.low_price" type="number" /> - <el-input
                            v-model="UserresumeruleForm.high_price" type="number" />
                    </el-form-item>
                    <el-button type="primary" plain @click="UserResumesubmitForm()">保存</el-button>
                </el-form>
            </el-card>
            
        </el-main>
    </el-container>
</template>
  
<script lang="ts">

import { ref } from 'vue'
import type { FormProps } from 'element-plus'
export default {

    name: 'Resume',
    created() {
        this.getResumeinfo()

    },


    data() {

        return {
            UserReadmeruleForm: {
                eduHighestLevel: '',
                eduHighestLevelTranslation: '',
                workingexpCode: '',
                workingexp: '',
                skilllabel: '',
                skilllabel2: [],
                SelfEvaluate: ''
            },
            UserresumeruleForm: {
                topic: '',
                topicTranslation: '',
                city1: '',
                city1Translation: '',
                city2: '',
                city2Translation: '',
                city3: '',
                city3Translation: '',
                low_price: 0,
                high_price: 3000
            },
            Userinforules: {
                photo: [
                    { required: false, message: '请上传证件照', trigger: 'blur' },
                ],
                name: [
                    { required: true, message: '请输入姓名', trigger: 'blur' },
                    { min: 2, max: 50, message: '长度应该在 3 - 50', trigger: 'blur' },
                ],
                birth: [
                    { required: true, message: '请选择生日', trigger: 'blur' },
                ],

            },

            UserinforuleForm: {
                name: '',
                birth: '',
                genderCode: '1',
                genderTranslation: '',

            },
            card1: true,
            card1Ico: true,
            card2: true,
            card2Ico: true,

            // imageUrl: '',
            formSize: 'default',
            labelPosition: ref<FormProps['labelPosition']>('left'),
            action: this.$ApiBaseUrl + this.$api['uploadphoto'],
            resumeinfo: {
                email: '',
                phone: '',
                photo: "",
                genderCode: null,
            },

        };
    },

    watch: {
        UserinforuleForm: {
            // 此处监听obj属性a值变量
            handler(item1, item2) {

                this['UserinforuleForm']['topic'] = this.$baseData['topic_code'][item1['topic']]
                this['UserinforuleForm']['genderTranslation'] = this.$baseData['genderObject'][item1['genderCode']]
               

            },
            deep: true,
            immediate: true
        },
        UserresumeruleForm: {
            handler(item1, item2) {
                this['UserresumeruleForm']['city1Translation'] = this.getname(this.$baseData['city_code'], item1['city1'])
                this['UserresumeruleForm']['city2Translation'] = this.getname(this.$baseData['city_code'], item1['city2'])
                this['UserresumeruleForm']['city3Translation'] = this.getname(this.$baseData['city_code'], item1['city3'])
                this['UserresumeruleForm']['topicTranslation'] = this.getname(this.$baseData['topic_code'], item1['topic'])
                if (item1['low_price'] < 0) {
                    this['UserresumeruleForm']['low_price'] = 0
                }
                if (item1['high_price'] < item1['low_price']) {
                    this['UserresumeruleForm']['high_price'] = item1['low_price']
                }
            },
            deep: true,
            immediate: true
        },
        resumeinfo: {
            // 此处监听obj属性a值变量
            handler(item1, item2) {
                // item1为新值，item2为旧值
                this['UserinforuleForm']['name'] = item1['name']
                this['UserinforuleForm']['birth'] = item1['birth']
                this['UserinforuleForm']['genderCode'] = item1['genderCode']
                
                this['UserresumeruleForm']['city1'] = !item1['city1'] ? null : item1['city1']
                this['UserresumeruleForm']['city1Translation'] = item1['city1Translation']
                this['UserresumeruleForm']['city2'] = !item1['city2'] ? null : item1['city2']
                this['UserresumeruleForm']['workcity2Translation'] = item1['workcity2Translation']
                this['UserresumeruleForm']['city3'] = !item1['city3'] ? null : item1['city3']
                this['UserresumeruleForm']['city3Translation'] = item1['city3Translation']
                this['UserresumeruleForm']['topic'] = item1['topic']
                this['UserresumeruleForm']['topicTranslation'] = item1['topicTranslation']
                this['UserresumeruleForm']['propertycode'] = item1['propertycode']
                this['UserresumeruleForm']['property'] = item1['property']
                this['UserresumeruleForm']['low_price'] = item1['low_price']
                this['UserresumeruleForm']['high_price'] = item1['high_price']

                
            },
            deep: true,
            immediate: true
        },
        

    },

    methods: {

        
        showInput() {
            this.inputVisible = true
            this.$nextTick(() => {
                this.$refs.InputRef.focus()
            })
        },
        
        getname(arr, code) {
            let res = ''
            try {
                arr.forEach(element => {
                    if (element['code'] == code) {
                        res = element['name']
                    }
                });
            } catch {

            }

            return res
        },
        retryupdate(response, uploadFile) {
            const headers = {
                'Content-Type': 'multipart/form-data', // 设置请求头为文件上传类型
            }
            const formData = new FormData();
            formData.append('file', uploadFile.raw!);
            // 使用 axios 发送请求，并添加新的 key 到请求参数中
            this.$http.post(this.$api['uploadphoto'], formData, { headers }).then(res => {
                this.getResumeinfo()
            }).catch(err => {
                this.$Message.error(`${err}`)
            });
        },
        async getResumeinfo() {

            this.$http.get(this.$api.resumeinfo, {
                headers: {
                    'Content-Type': 'application/json',
                }
            }).then(response => {
                this.resumeinfo = response.data.data

            })

        },
        openCard(num) {
            if (num == 1) {
                this.card1 = !this.card1
                this.card1Ico = !this.card1Ico
            } else if (num == 2) {
                this.card2 = !this.card2
                this.card2Ico = !this.card2Ico
            } 
        },
        async UserinfosubmitForm() {
            this.$refs.UserinforuleFormRef.validate((valid) => {
                if (!valid) {

                    return false
                }
                this.changebaseinfo()

            })

        },
        async UserResumesubmitForm() {
            this.$refs.UserresumeruleFormRef.validate((valid) => {
                if (!valid) {

                    return false
                }
                this.changeresumeinfo()

            })
        },
        
        async changeReadme() {
            let Loading = this.$Loading({ fullscreen: true })
            let response = await this.$http
                .post(this.$api.changereadme, this.UserReadmeruleForm)
                .then(response => {
                    // 登录成功，获取访问令牌和刷新令牌并保存到本地（例如使用localStorage）
                    if (response['data']['code'] == 200) {
                        Loading.close()
                        this.$Message({
                            type: 'success',
                            message: "保存成功"
                        })
                        this.getResumeinfo()
                    } else {
                        this.$Message.error(response['data']['msg'])
                        Loading.close()
                    }

                })
                .catch(error => {
                    Loading.close()
                    this.$Message.error('系统异常,请联系管理员')
                });
        },
        async changeresumeinfo() {
            let Loading = this.$Loading({ fullscreen: true })
            let response = await this.$http
                .post(this.$api.changeresumeinfo, this.UserresumeruleForm)
                .then(response => {
                    // 登录成功，获取访问令牌和刷新令牌并保存到本地（例如使用localStorage）
                    if (response['data']['code'] == 200) {
                        Loading.close()
                        this.$Message({
                            type: 'success',
                            message: "保存成功"
                        })
                        this.getResumeinfo()
                    } else {
                        this.$Message.error(response['data']['msg'])
                        Loading.close()
                    }

                })
                .catch(error => {
                    Loading.close()
                    this.$Message.error('系统异常,请联系管理员')
                });
        },
        async changebaseinfo() {
            let Loading = this.$Loading({ fullscreen: true })
            let response = await this.$http
                .post(this.$api.changebaseinfo, {
                    name: this['UserinforuleForm']['name'] ? this['UserinforuleForm']['name'] : '',
                    birth: this['UserinforuleForm']['birth'] ? this['UserinforuleForm']['birth'] : null,
                    genderCode: this['UserinforuleForm']['genderCode'] ? this['UserinforuleForm']['genderCode'] : 1,
                    genderTranslation: this['UserinforuleForm']['genderTranslation'] ? this['UserinforuleForm']['genderTranslation'] : '男',
                    
                })
                .then(response => {
                    // 登录成功，获取访问令牌和刷新令牌并保存到本地（例如使用localStorage）
                    if (response['data']['code'] == 200) {
                        Loading.close()
                        this.$Message({
                            type: 'success',
                            message: "保存成功"
                        })
                        this.getResumeinfo()
                    } else {
                        this.$Message.error(response['data']['msg'])
                        Loading.close()
                    }

                })
                .catch(error => {
                    Loading.close()
                    this.$Message.error('系统异常,请联系管理员')
                });

        },
        handleAvatarSuccess(
            response,
            uploadFile
        ) {
            // this.imageUrl = URL.createObjectURL(uploadFile.raw!)
            this.getResumeinfo()


        },
        beforeAvatarUpload(rawFile) {
            console.log(rawFile.type)
            if (rawFile.type !== 'image/jpeg' && rawFile.type !== 'image/png' && rawFile.type !== 'image/jpg') {
                this.$Message.error('Avatar picture must be JPG/PNG format!')
                return false
            } else if (rawFile.size / 1024 / 1024 > 2) {
                this.$Message.error('Avatar picture size can not exceed 2MB!')
                return false
            }
            return true
        }

    }
}
</script>

<style>
.address>div,
.salary>div {
    flex-direction: row !important;
    flex-wrap: nowrap !important;
}

.skill>div {
    flex-direction: row !important;
    flex-wrap: nowrap !important;

}

.skill .el-input {
    width: 200px !important;
}

.salary>div {
    max-width: 300px !important;
    justify-content: space-between !important;
}

.address .el-input__wrapper {
    margin-right: 5px !important;
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.folded .el-card__body {
    display: none !important;
}

.avatar {
    width: 120px;
    height: 120px;
}

.readonly .el-input__wrapper {
    background-color: rgba(85, 84, 84, 0.1) !important;
}

.avatar-uploader .el-upload {
    border: 1px dashed var(--el-border-color);
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
    border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    text-align: center;
}
</style>
  