<template>
  <div>
    <div>
      <div>
        <!-- 下拉选择学期-使用中 -->
        <el-select
          class="semester-select"
          @change="handleSelectChange"
          clearable
          v-model="semester"
          placeholder="请选择学期"
        >
          <el-option v-for="(item,index) in semesterData" :key="index" :value="item" 
          @click.native="allClassTask()"></el-option>
        </el-select>
        
        <!-- 添加课程计划 -->
        <div>
          <el-button class="add-button" 
          style="margin-left: 10px; float:left" 
          size="small" type="primary" 
          @click="addClassTask()">添加课程计划</el-button>
          <el-button class="add-button" size="small" type="primary" @click="arrangeCourse()">
            排课
            <i class="el-icon-thumb el-icon--right"></i>
          </el-button>
        </div>
      </div>
    </div>
    <!-- 开课任务，等待排课的课程 -->
    <el-table class="ckasstask-table" :data="classTaskData" size="mini" :stripe="true" :highlight-current-row="true">
      <el-table-column label="序号" type="selection"></el-table-column>
      <el-table-column prop="semester" label="学期" width="110px"></el-table-column>
      <el-table-column prop="gradeNo" label="年级" width="60px">
        <template slot-scope="scope">
          <span v-if="scope.row.gradeNo == '01'">大一</span>
          <span v-if="scope.row.gradeNo == '02'">大二</span>
          <span v-if="scope.row.gradeNo == '03'">大三</span>
          <span v-if="scope.row.gradeNo == '04'">大四</span>
        </template>
      </el-table-column>
      <el-table-column prop="className" label="班级" width="110px"></el-table-column>
      <el-table-column prop="courseNo" label="课号" ></el-table-column>
      <el-table-column prop="courseName" label="课名" ></el-table-column>
      <el-table-column prop="courseAttr" label="课属性" >
        <template slot-scope="scope">
          <span v-if="scope.row.courseAttr == '01'">必修</span>
          <span v-if="scope.row.courseAttr == '02'">选修</span>
          <span v-if="scope.row.courseAttr == '03'">实践</span>
          <span v-if="scope.row.courseAttr == '04'">体育</span>
          <span v-if="scope.row.courseAttr == '05'">艺术</span>
        </template>
      </el-table-column>
      <el-table-column prop="teacherNo" label="讲师编号" ></el-table-column>
      <el-table-column prop="realname" label="讲师" ></el-table-column>
      <el-table-column prop="studentNum" label="学生人数" ></el-table-column>
      <el-table-column prop="weeksNumber" label="周学时" ></el-table-column>
      <el-table-column prop="weeksSum" label="周数" ></el-table-column>
      <!-- 是否固定时间 -->
      <el-table-column prop="isFix" label="固定" >
        <template slot-scope="scope">
          <span v-if="scope.row.isFix == '1'">否</span>
          <span v-if="scope.row.isFix == '2'">是</span>
        </template>
      </el-table-column>
      <!-- 只有固定上课时间才会有固定的时间在时间这个列中 -->
      <el-table-column prop="classTime" label="时间" ></el-table-column>

      <el-table-column prop="operation" label="操作" width="150px">
        <template slot-scope="scope">
          <el-button type="danger" size="mini" @click="deleteById(scope.$index, scope.row)">删除</el-button>
          <el-button type="primary" size="mini" @click="editById(scope.$index, scope.row)">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 弹出表单添加课程计划 -->
    <el-dialog title="添加课程计划" 
    :visible.sync="visible"
    >
      <el-form :model="addClassTaskForm" label-position="left" label-width="80px" :rules="addClassTaskRules">

        <!-- 学期 -->
        <el-form-item label="学期" prop="semester">
          <el-input v-model="addClassTaskForm.semester" 
          autocomplete="off" 
          style="width: 200px;float: left;"></el-input>
          <span class="span">(输入格式如:2020-2021-1)</span>
        </el-form-item>

        <!-- 年级 -->
        <el-form-item label="年级" prop="gradeNo">
          <el-select v-model="addClassTaskForm.gradeNo" placeholder="请选择年级" style="width: 200px;float: left;" clearable>
            <el-option
              v-for="item in grades"
              :key="item.value"
              :label="item.label"
              :value="item.value"
              @click.native="getGradeNo()"
              >
            </el-option>
          </el-select>
        </el-form-item>
        
        <el-row>
          <el-col :span="8">
            <!-- 班级编号 -->
            <el-form-item label="班级" prop="className">
              <!-- <el-input v-model="addClassTaskForm.classNo" autocomplete="off"></el-input> -->
              <el-select v-model="addClassTaskForm.className" placeholder="请选择班级" style="width: 200px;float: left;" clearable>
                <el-option
                  v-for="item in classNames"
                  :key="item.value"
                  :label="item.label"
                  :value="item.label"
                  @click.native="choiceclassNo()"
                  >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <!-- 班级编号编号，根据选择的班级自动填充班级编号 -->
            <el-form-item label="班级编号" prop="classNo" style="width: 200px; margin-left: 60px">
              <el-input v-model="addClassTaskForm.classNo" autocomplete="off" :disabled="true" style="width: 200px;"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
          
        <el-row>
          <el-col :span="8">
            <!-- 课程名 -->
            <el-form-item label="课程名" prop="courseName">
              <el-select v-model="addClassTaskForm.courseName" placeholder="请选择课程" style="width: 200px;float: left;" clearable>
                <el-option
                  v-for="item in courseNames"
                  :key="item.id"
                  :label="item.label"
                  :value="item.value"
                  @click.native="choiceCourseNo()">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <!-- 课程编号，根据选择的课程名自动填充课程编号 -->
            <el-form-item label="课程编号" prop="courseNo" style="width: 200px; margin-left: 60px">
              <el-input v-model="addClassTaskForm.courseNo" autocomplete="off" :disabled="true" style="width: 200px;"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="8">
            <el-form-item label="讲师名字" prop="realname">
              <!-- <el-input v-model="addClassTaskForm.realname" autocomplete="off"></el-input> -->
              <el-select v-model="addClassTaskForm.realname" placeholder="请选教师" style="width: 200px;float: left;" clearable>
                <el-option
                  v-for="item in teacherNames"
                  :key="item.id"
                  :label="item.label"
                  :value="item.value"
                  @click.native="choiceRealNo()"
                  >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <!-- 教师编号，根据选择的教师名自动填充教师编号 -->
            <el-form-item label="讲师编号" prop="teacherNo" style="width: 200px; margin-left: 60px">
              <el-input v-model="addClassTaskForm.teacherNo" autocomplete="off" :disabled="true" style="width: 200px;"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <!-- 课程属性 -->
        <el-form-item label="课程属性" prop="courseAttr">
          <!-- <el-input v-model="addClassTaskForm.courseAttr" autocomplete="off"></el-input> -->
          <el-select v-model="addClassTaskForm.courseAttr" placeholder="课程属性" style="width: 200px;float: left;" clearable>
            <el-option
              v-for="item in courseAttrs"
              :key="item.id"
              :label="item.label"
              :value="item.value"
              >
            </el-option>
          </el-select>
        </el-form-item>
            
        <el-form-item label="学生人数" prop="studentNum">
          <el-input v-model="addClassTaskForm.studentNum" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="周学时" prop="weeksNumber">
          <el-input v-model="addClassTaskForm.weeksNumber" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="周数" prop="weeksSum">
          <el-input v-model="addClassTaskForm.weeksSum" autocomplete="off"></el-input>
        </el-form-item>

        <el-row>
          <el-col :span="8">
            <!-- 上课时间是否固定？ -->
            <el-form-item label="固定时间" prop="isFix">
              <!-- <el-input v-model="addClassTaskForm.isFix" autocomplete="off"></el-input> -->
              <el-select v-model="addClassTaskForm.isFix" placeholder="课程属性" style="width: 200px;float: left;" clearable>
                <el-option
                  v-for="item in isFixs"
                  :key="item.id"
                  :label="item.label"
                  :value="item.value"
                  >
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <!-- 上课时间 -->
            <el-form-item label="上课时间" prop="classTime" style="width: 200px; margin-left: 60px">
              <el-input v-model="addClassTaskForm.classTime" 
              autocomplete="off" 
              :disabled="addClassTaskForm.isFix == '1'" 
              style="width: 200px;"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
            
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="visible = false">取 消</el-button>
        <el-button type="primary" @click="commit()">提 交</el-button>
      </div>
    </el-dialog>

    <!-- 分页 -->
    <div class="footer-button">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page.sync="page"
        :page-size="pageSize"
        layout="total, prev, pager, next"
        :total="total"
      ></el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  name: "ClassTaskList",
  data() {
    return {
      classNames: [], // 班级编号数据
      courseNames: [], //课程名数据
      teacherNames: [], //教师数据
      importBtnDisabled: false, // 按钮是否禁用,
      loading: false,
      isFixs: [{
          value: '1',
          label: '否'
      },{
          value: '2',
          label: '是'
      }],
      courseAttrs: [{
          value: '01',
          label: '必修课程' 
      },{
          value: '02',
          label: '选修课程' 
      },{
          value: '03',
          label: '实验实践课程' 
      },{
          value: '04',
          label: '体育课程' 
      },{
          value: '05',
          label: '艺术课程' 
      }],
      grades: [{
          value: '01',
          label: '大一'
        }, {
          value: '02',
          label: '大二'
        }, {
          value: '03',
          label: '大三'
        }, {
          value: '04',
          label: '大四'
        }],
      classTaskData: [],
      semesterData: [],
      addClassTaskForm: {
        semester: '',
        gradeNo: '',
        className: '',
        classNo: '',
        courseNo: '',
        courseName: '',
        teacherNo: '',
        realname: '',
        courseAttr: '',
        studentNum: '',
        weeksNumber: '',
        weeksSum: '',
        isFix: '',
        classTime: ''
      },
      visible: false,
      updateOrAdd: '',
      page: 1,
      total: 0,
      pageSize: 10,
      // 学期选择默认值
      semester: "",
      fileList: [],
      addClassTaskRules: {
        semester: [{ required: true, message: '请输入学期', trigger: 'blur' }],
        gradeNo: [{ required: true, message: '请输入年级编号', trigger: 'blur' }],
        className: [{ required: true, message: '请选择班级', trigger: 'blur' }],
        classNo: [{ required: true, message: '请输入班级编号', trigger: 'blur' }],
        courseNo: [{ required: true, message: '请输入课程编号', trigger: 'blur' }],
        courseName: [{ required: true, message: '请输入课程名称', trigger: 'blur' }],
        teacherNo: [{ required: true, message: '请输入讲师编号', trigger: 'blur' }],
        realname: [{ required: true, message: '请输入讲师姓名', trigger: 'blur' }],
        courseAttr: [{ required: true, message: '请输入课程属性', trigger: 'blur' }],
        studentNum: [{ required: true, message: '请输入班级学生人数', trigger: 'blur' }],
        weeksNumber: [{ required: true, message: '请输入周学时', trigger: 'blur' }],
        weeksSum: [{ required: true, message: '请输入上课周数', trigger: 'blur' }],
        isFix: [{ required: true, message: '是否固定上课时间', trigger: 'blur' }],
        classTime: []
      }
    };
  },

  /**
   * 加载Vue实例时执行
   */
  mounted() {
    this.allClassTask();
    this.getSemester();
  },
  created() {
      // 为是否固定上课时间选项设置默认值。
      this.addClassTaskForm.isFix = this.isFixs[0].value;
    },
  methods: {
   
    // 获取所有教师名
    getRealnameAll(){
      this.teacherNames = [];
      this.$axios.get("http://localhost:8080/teacher/selectTeacherAll")
      .then(res => {
        res.data.data.forEach(val => {
          var lab = { label: val.realname, value: val.realname, key: val.id};
          this.teacherNames.push(lab);
        });
      })
      .catch(error => {
        alert(res.data.message);
      })
    },

    // 根据已选择的教师名填充教师编号
    choiceRealNo(){
      this.$axios.post("http://localhost:8080/teacher/selectTeacherNo", this.addClassTaskForm.realname)
      .then(res => {
        this.addClassTaskForm.teacherNo = res.data.data.teacherNo;
      })
      .catch(error => {
        alert(res.data.message);
      })
    },

    // 根据已选择的班级填充课班级编号
    choiceclassNo(){
      this.$axios.post("http://localhost:8080/classInfo/selectByClassName", this.addClassTaskForm.className)
      .then(res => {
        this.addClassTaskForm.classNo = res.data.data.classNo;
      })
      .catch(error => {
        alert(res.data.message)
      })
    },

    // 根据已选择的课程名填充课程编号
    choiceCourseNo(){
      this.$axios.post("http://localhost:8080/courseinfo/selectByCourseName", this.addClassTaskForm.courseName)
      .then(res => {
        this.addClassTaskForm.courseNo = res.data.data.courseNo;
      })
      .catch(error => {
        alert(res.data.message)
      })
    },
    
    // 获取所有课程名
    getCourseNameAll(){
      this.courseNames = [];
      this.$axios.get("http://localhost:8080/courseinfo/getCourse")
      .then(res => {
        res.data.data.forEach(val => {
          var lab = { label: val.courseName, value: val.courseName, key: val.id};
          this.courseNames.push(lab);
        });
      })
      .catch(error => {
        alert(res.data.message)
      })
    },

    // 获取所有课堂编号
    getGradeNo() {
      this.classNames = [];
      this.$axios.get("http://localhost:8080/class-grade/" + this.addClassTaskForm.gradeNo)
      .then(res => {
        res.data.data.forEach(val => {
          var lab = { label: val.className, value: val.classNo, key: val.id };
          this.classNames.push(lab);
        });
      })
      .catch(error => {
        alert('获取失败')
      })
    },

    // 提交添加
    commit() {
      if (this.updateOrAdd == '0'){
        this.$axios.post("http://localhost:8080/addclasstask", this.addClassTaskForm)
        .then(res => {
          if (res.data.code == 0) {
            // 添加完成
            this.allClassTask()
            this.visible = false
            this.$message({message: "添加课程任务成功！", type: "success"})
          } else {
            alert(res.data.message)
          }
        })
        .catch(error => {
        })
      } else if(this.updateOrAdd == '1'){
        this.$axios.post("http://localhost:8080/updateClasstask", this.addClassTaskForm)
        .then(res => {
          if (res.data.code == 0) {
            // 修改完成
            this.allClassTask()
            this.visible = false
            this.$message({message: "修改课程任务成功！", type: "success"})
          } else {
            alert(res.data.message)
          }
        })
        .catch(error => {
        })
      }
      
    },

    // 手动添加课程任务
    addClassTask() {
      this.updateOrAdd = '0';
      this.addClassTaskForm = {};
      this.getCourseNameAll();
      this.getRealnameAll();
      this.visible = true
    },

    // 点击开始提交学期到系统后台排课
    arrangeCourse() {
      if(this.semester == ""){
        alert("请选择学期");
      }else{
        this.$axios.post("http://localhost:8080/arrange/" + this.semester)
        .then(res => {
        if (res.data.code == 0) {
          this.allClassTask()
          this.$message({message: '排课成功', type: 'success'})
          this.$router.push('/coursetable')
        } else {
          this.$message.error('排课失败')
          this.$message.error(res.data.message)
        }
      })
      .catch(error => {
        this.$message.error('排课失败')
      })
      }
    },

    // 上传成功
    uploadSuccess(response, file, fileList) {
      this.loading = false
      this.allClassTask()
      this.$message({message: "上传成功", type:"success"})
    },

    handleRemove(file, fileList) {

    },

    handleError(error, file, fileList) {
      alert("文件上传失败" + error)
    },

    // 提交上传文件事件
    // submitUpload() {
    //   this.loading = true
    //   this.$refs.upload.submit()
    // },

    // 得到对应选中的年级
    handleSelectChange(val) {
      // 这里的V就是选择的学期了
      this.semester = val
      
    },

    deleteById(index, row) {
      this.deleteClassTaskById(row.id);
    },

    editById(index, row) {
      this.updateOrAdd = '1';
      this.addClassTaskForm = Object.assign({}, row);
      this.getCourseNameAll();
      this.getRealnameAll();
      this.getGradeNo();
      this.visible = true
    },

    handleSizeChange() {},

    handleCurrentChange(v) {
      this.page = v
      this.allClassTask()
    },

    /**
     * 获得学期列表后默认填充第一个到学期选择下拉列表中
     * 这里只放一个学期先吧
     */
    getSemester() {
      this.$axios
        .get("http://localhost:8080/semester")
        .then(res => {
          let ret = res.data.data
          this.semesterData = ret
        })
        .catch(error => {
        });
    },

    /**
     * 获得所有开课任务
     */
    allClassTask() {
      let semesterBak = this.semester;
      if(this.semester == ""){
        semesterBak = "0"
      }
      this.$axios
        .get(
          "http://localhost:8080/classtask/" + this.page + "/" + semesterBak
        )
        .then(res => {
          let ret = res.data.data
          this.classTaskData = ret.records
          this.total = ret.total
          if (this.total == 0) {
            this.$message({message: '查询不到开课任务', type: 'success'})
          }
        })
        .catch(error => {
          this.$message.error("查询开课任务失败");
        });
    },

    /**
     * 删除开课任务
     */
    deleteClassTaskById(id) {
      this.$axios
        .delete("http://localhost:8080/deleteclasstask/" + id)
        .then(res => {
          this.allClassTask();
          this.$message({ message: "删除成功", type: "success" })
        })
        .catch(error => {
          this.$message.error("删除失败")
        });
    }
  }
};
</script>

<style lang="less" scoped>

.footer-button {
  margin-top: 10px;
}

.semester-select {
  float: left;
  margin-bottom: 10px;
}

.tips {
  float: left;
  margin-left: 5px;
}

.ckasstask-table {
  margin-top: 10px;
}

.add-button {
  float: left;
  margin-left: 15px;
}
.span {
  color:rgb(252, 115, 2);
  float: left;
  margin-left: 10px;
}
</style>