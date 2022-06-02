import Vue from 'vue';
import Router from 'vue-router';
import Login from '@/pages/Login';
import Register from '@/pages/Register';

import Admin from '@/views/loginModular/Admin';
import SystemData from '@/views/systemdataModular/SystemData/';
import ClassTaskList from '@/views/courseSchedulingManagement/ClassTaskList';
import CourseTable from '@/views/courseSchedulingManagement/CourseTable';
import TeacherList from '@/views/basicManagement/TeacherList';
import ClassManager from '@/views/basicManagement/ClassManager';
import StudentList from '@/views/basicManagement/StudentList';
import CourseInfoList from '@/views/basicManagement/CourseInfoList';
import ClassroomList from '@/views/teachingFacilities/ClassroomList';
import TeachBuildingList from '@/views/teachingFacilities/TeachBuildingList';
import TeachAreaSetting from '@/views/teachingFacilities/TeachAreaSetting';

import ManagerMain from '@/manager/ManagerMain';
import HomeWork from '@/manager/components/HomeWork';
import StudentCourseTable from '@/home/components/CourseTable';
import EmptyClassroom from '@/home/components/EmptyClassroom';
import StudentCenter from '@/home/components/Center';
import StudentPassword from '@/home/components/Password';
import UpdatePass from '@/pages/components/UpdatePass';
import StudentMain from '@/home/StudentMain';

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'AdminLogin',
      component: Admin,
      meta: { 
        noRequireAuth: true
      },
    },
    {
      path: '/student/login',
      name: 'Login',
      component: Login,
      meta: { 
        noRequireAuth: true
      },
    },
    {
      path: '/student/register',
      name: 'Register',
      component: Register,
      meta: { 
        noRequireAuth: true
      },
    },
    {
      path: '/admin/login',
      name: 'AdminLogin',
      component: Admin,
      meta: { 
        noRequireAuth: true
      },
    },
    {
      path: '/student',
      name: 'Student',
      component: StudentMain,
      meta: { 
        noRequireAuth: true
      },
      children: [
        
        {
          path: '/emptyclassroom',
          name: 'EmptyClassroom',
          component: EmptyClassroom
        },
        {
          path: '',
          name: 'CourseList-default',
          component: StudentCourseTable
        },
        {
          path: '/courseList',
          name: 'CourseList',
          component: StudentCourseTable
        },
        {
          path: '/center',
          name: 'StudentCenter',
          component: StudentCenter
        },
        {
          path: '/password',
          name: 'Password',
          component: StudentPassword
        }
      ]
    },
    {
      path: '/admin',
      name: 'Admin',
      component: ManagerMain,
      children: [
        {
          path: '/updatepass',
          name: 'UpdatePass',
          component: UpdatePass
        },
        {
          path: '/systemdata',
          name: 'SystemData',
          component: SystemData
        },
        {
          path: '/teacherlist',
          name: 'TeacherList',
          component: TeacherList
        },
        {
          path: '/studentlist',
          name: 'StudentList',
          component: StudentList
        },
        {
          path: '/teachbuildinglist',
          name: 'TeachBuildingList',
          component: TeachBuildingList
        },
        {
          path: '/classroomlist',
          name: 'ClassroomList',
          component: ClassroomList
        },
        {
          path: '/coursetable',
          name: 'CourseTable',
          component: CourseTable
        },
        {
          path: '/courseinfolist',
          name: 'CourseInfoList',
          component: CourseInfoList
        },
        {
          path: '/classtasklist',
          name: 'ClassTaskList',
          component: ClassTaskList
        },
        {
          path: '/classmanager',
          name: 'ClasssManager',
          component: ClassManager
        },
        {
          path: '/setteacharea',
          name: 'TeachAreaSetting',
          component: TeachAreaSetting
        },
        {
          path: '/homework',
          name: 'HomeWork',
          component: HomeWork
        }
      ]
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (!to.matched.some(res => res.meta.noRequireAuth)) {// 判断是否需要登录权限
    if (window.localStorage.getItem('teacher') || window.localStorage.getItem("admin") ) {// 判断是否登录
      next()
    } else {
      next({
        path: '/',
        query: { redirect: to.fullPath }
      })
    }
  } else {
    next()
  }
  next()
})


export default router