<template>
    <div class="comment-section">


        <!-- 添加评论表单 -->
        <div class="comment-form">
            <el-form ref="commentForm" :model="newComment">
                <el-form-item label="评论内容">
                    <el-input type="textarea" v-model="newComment.content" resize="none" maxlength="50"
                        show-word-limit></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitComment">发表评论</el-button>
                </el-form-item>
            </el-form>
        </div>
        <!-- 评论列表 -->
        <ul v-infinite-scroll="getcomment" class="infinite-list" style="overflow: auto">
            <li v-for="comment in comments" :key="comment.id" class="comment-item">
                <div class="comment-info">
                    <span class="username">{{ comment.username }}</span>
                    <span class="timestamp">{{ new Date(comment.create_time).toLocaleString() }}</span>
                </div>
                <p class="comment-content">{{ comment.content }}</p>
            </li>
        </ul>
    </div>
</template>
  
<script>

export default {
    name: 'Comment',
    props: {
        id: {
            type: Number,
            required: true,
        },

    },
    created() {
        this.getcomment()
    }
    ,
    data() {

        return {
            comments: [

            ],
            maxpage: 1,
            page:1,
            newComment: {
                id:this.id,
                content: ''
            }
        };
    },
    methods: {
        async getcomment() {

            if (this.page <= this.maxpage && this.id) {
                let Loading = this.$Loading({ fullscreen: true })
                let response = await this.$http
                    .get(this.$api.commenttravel + `?id=${this.id}&page=${this.page}`)
                    .then(response => {
                        this.comments = [...this.comments, ...response.data.data]
                        this.maxpage = Math.ceil(response.data.count / 20)

                        this.page += 1
                        Loading.close()
                    })
                    .catch(error => {
                        Loading.close()
                        this.$Message.error('未查询到数据')
                    });
            }

        },
        async refrashcomment() {

        if (this.page <= this.maxpage && this.id) {
            let Loading = this.$Loading({ fullscreen: true })
            let response = await this.$http
                .get(this.$api.commenttravel + `?id=${this.id}&page=${this.page}`)
                .then(response => {
                    this.comments = response.data.data
                    this.maxpage = Math.ceil(response.data.count / 20)

                    this.page += 1
                    Loading.close()
                })
                .catch(error => {
                    Loading.close()
                    this.$Message.error('未查询到数据')
                });
        }

        },
        async submitComment() {
            let Loading = this.$Loading({ fullscreen: true })
            if(this.newComment.content!=''){
                let response = await this.$http
                .post(this.$api.comment ,this.newComment)
                .then(response => {
                    if(response.data.code=="200"){
                        this.page=1
                    this.refrashcomment()
                    Loading.close()
                    this.$Message({ type: 'success', message: '评论成功' })
                    }
                    else{
                        this.$Message.error(response.data.msg,response.data.data)
                    }

                })
                .catch(error => {
                    Loading.close()
                    this.$Message.error(error)
                });
            }else{
                this.$Message.error('评论不能为空')
                Loading.close()
            }
            

            // 清空表单
            this.newComment.username = '';
            this.newComment.content = '';
        }
    }
};
</script>
  
<style scoped>
.comment-section {
    width: 100%;
    margin: 0 auto;
}

.comment-item {
    margin-bottom: 20px;
    border: 1px solid #ccc;
    padding: 10px;
}

.comment-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 5px;
}

.username {
    font-weight: bold;
}

.comment-content {
    margin: 0;
}

.comment-form {
    margin-top: 20px;
}
</style>