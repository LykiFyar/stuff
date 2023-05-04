#define _USE_MATH_DEFINES
#include <math.h>

#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif
#include<stdio.h>

// distance to target
float dist = 700;
// distance between the eyes
float disp = 30;

float k, s = 0;

float pos[3] = { 0, 0, 500 };
float dir[3] = {-pos[0],-pos[1],-pos[2]};
float up[3] = { 0,1,0 };

float angle=0;
float cBlack[] = {0,0,0,0};
float cWhite[] = {1,1,1,1};
float cRed[] = {0.4,0,0};
float cGreen[] = {0,0.4,0.4};
float cRedish[] = {0.2,0,0};
float cGreenish[] = {0,0.2,0.2};

void cross(float* a, float* b, float* res) {

	res[0] = a[1] * b[2] - a[2] * b[1];
	res[1] = a[2] * b[0] - a[0] * b[2];
	res[2] = a[0] * b[1] - a[1] * b[0];
}


void normalize(float* a) {

	float l = sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);
	a[0] = a[0] / l;
	a[1] = a[1] / l;
	a[2] = a[2] / l;
}

void changeSize(int w, int h) {

	// Prevent a divide by zero, when window is too short
	// (you cant make a window of zero width).
	if(h == 0)
		h = 1;

	float ratio = 1.0* w / h;

	// Reset the coordinate system before modifying
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	
	// Set the viewport to be the entire window
    glViewport(0, 0, w, h);

	// Set the correct perspective.
	gluPerspective(45,ratio,400,10000);
	glMatrixMode(GL_MODELVIEW);
}

void processKeys(unsigned char key, int xx, int yy) {

	float r[3];
	normalize(dir);
	cross(dir, up, r);

	// put code to process regular keys in here
	switch (key)
	{
	case 'w':
		pos[0] = pos[0] + dir[0];
		pos[1] = pos[1] + dir[1];
		pos[2] = pos[2] + dir[2];
		break;
	case 'a':
		pos[0] = pos[0] - r[0];
		pos[1] = pos[1] - r[1];
		pos[2] = pos[2] - r[2];
		break;
	case 's':
		pos[0] = pos[0] - dir[0];
		pos[1] = pos[1] - dir[1];
		pos[2] = pos[2] - dir[2];
		break;
	case 'd':
		pos[0] = pos[0] + r[0];
		pos[1] = pos[1] + r[1];
		pos[2] = pos[2] + r[2];
		break;

	default:
		k = 0;
		//kr = 0;
		break;
	}
}



void renderScene(void) {

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();

	float lpos[] = { 1,1,0,0 };

	/*
	dir[0] = 0 - pos[0];
	dir[1] = 0 - pos[1];
	dir[2] = 0 - pos[2];
	*/
	// teapot size
	float ts = 150;


	normalize(dir);

	float r[3];
	cross(dir, up, r);

	glColorMask(GL_TRUE, GL_FALSE, GL_FALSE, GL_TRUE);
	// set camera for red eye.
	gluLookAt(pos[0] - r[0]*disp, pos[1] - r[1] * disp, pos[2] - r[2] * disp,
				pos[0] + dir[0] * 1000, pos[1] + dir[1] * 1000, pos[2] + dir[2] * 1000,
				up[0], up[1], up[2]);
	// draw scene
	glutWireTeapot(ts);

	glLoadIdentity();

	glClear(GL_DEPTH_BUFFER_BIT);
	glColorMask(GL_FALSE, GL_TRUE, GL_TRUE, GL_TRUE);
	// set camera for blue eye.
	gluLookAt(pos[0] + r[0] * disp, pos[1] + r[1] * disp, pos[2] + r[2] * disp, pos[0] + dir[0] * 1000, pos[1] + dir[1] * 1000, pos[2] + dir[2] * 1000, up[0], up[1], up[2]);
	// draw scene
	glutWireTeapot(ts);

	glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);

	glutSwapBuffers();

	angle+=0.25;
}

void processNormalKeys(unsigned char key, int x, int y) {

	char s[20];
	if (key == 27) 
		exit(0);
	switch(key) {
		case 'a' : dist *=.9;break;
		case 's' : dist *= 1.1; break;
	}
	sprintf(s,"%f", dist);
	glutSetWindowTitle(s);

}


int main(int argc, char **argv) {

	// GLUT and window init
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
	glutInitWindowPosition(100,100);
	glutInitWindowSize(320,320);
	glutCreateWindow("CG @ DI");

	// GLUT callbacks
	glutDisplayFunc(renderScene);
	glutIdleFunc(renderScene);
	glutReshapeFunc(changeSize);
	glutKeyboardFunc(processKeys);
	
	// OpenGL settings
	glEnable(GL_DEPTH_TEST);
//	glEnable(GL_CULL_FACE);

	/*

	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glEnable(GL_COLOR_MATERIAL);
	glColorMaterial(GL_FRONT_AND_BACK,GL_AMBIENT_AND_DIFFUSE);
	*/

	glClearColor(0.0f,0.0f,0.0f,0.0f);


	glutMainLoop();

	return 0;
}

