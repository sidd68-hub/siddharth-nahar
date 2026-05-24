"use client";

import React, { Suspense, useEffect, useState } from "react";

import { Canvas } from "@react-three/fiber";

import {
  OrbitControls,
  Stars,
} from "@react-three/drei";

import { motion } from "framer-motion";

import {
  ArrowRight,
  Mail,
} from "lucide-react";

import { useRive } from "@rive-app/react-canvas";

const skills = [
  {
    name: "Flutter",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg",
  },
  {
    name: "Dart",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg",
  },
  {
    name: "Firebase",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg",
  },
  {
    name: "Supabase",
    icon: "https://seeklogo.com/images/S/supabase-logo-DCC676FFE2-seeklogo.com.png",
  },
  {
    name: "GraphQL",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/graphql/graphql-plain.svg",
  },
  {
    name: "Bloc",
    icon: "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png",
  },
  {
    name: "Cubit",
    icon: "https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/cubit_logo_full.png",
  },
  {
    name: "Provider",
    icon: "https://cdn-icons-png.flaticon.com/512/2103/2103633.png",
  },
  {
    name: "REST API",
    icon: "https://cdn-icons-png.flaticon.com/512/2165/2165004.png",
  },
  {
    name: "WebRTC",
    icon: "https://upload.wikimedia.org/wikipedia/commons/9/9c/WebRTC_logo.svg",
  },
];

const projects = [
  {
    title: "SyncWave",
    desc: "Real-time synchronized music streaming platform with WebRTC integration.",
    tech: ["Flutter", "Firebase", "WebRTC"],
    gradient: "from-cyan-500/20 to-blue-500/20",
  },
  {
    title: "ExpenseAI",
    desc: "AI-powered expense tracking with intelligent categorization and insights.",
    tech: ["Flutter", "Firebase", "GraphQL"],
    gradient: "from-violet-500/20 to-pink-500/20",
  },
  {
    title: "RideFlow",
    desc: "Scalable ride-sharing application with real-time location tracking.",
    tech: ["Flutter", "REST API", "Maps"],
    gradient: "from-blue-500/20 to-cyan-500/20",
  },
];

function DashAnimation() {
  const { RiveComponent } = useRive({
    src: "/flutter_dash.riv",
    autoplay: true,
  });

  return <RiveComponent />;
}

function CursorGlow() {
  const [position, setPosition] = useState({
    x: 0,
    y: 0,
  });

  useEffect(() => {
    const handleMouseMove = (
      e: MouseEvent
    ) => {
      setPosition({
        x: e.clientX,
        y: e.clientY,
      });
    };

    window.addEventListener(
      "mousemove",
      handleMouseMove
    );

    return () => {
      window.removeEventListener(
        "mousemove",
        handleMouseMove
      );
    };
  }, []);

  return (
    <div
      className="fixed w-80 h-80 rounded-full bg-cyan-500/10 blur-[100px] pointer-events-none -z-10"
      style={{
        left: position.x,
        top: position.y,
        transform:
          "translate(-50%, -50%)",
      }}
    />
  );
}

export default function Home() {
  return (
    <main className="relative min-h-screen overflow-hidden bg-black text-white">
      {/* CURSOR */}

      <CursorGlow />

      {/* GALAXY */}

      <div className="absolute inset-0 z-0">
        <Canvas>
          <Suspense fallback={null}>
            <ambientLight intensity={1.2} />

            <Stars
              radius={400}
              depth={120}
              count={20000}
              factor={10}
              saturation={0}
              fade
              speed={1.5}
            />

            <OrbitControls
              enableZoom={false}
              autoRotate
              autoRotateSpeed={0.2}
            />
          </Suspense>
        </Canvas>
      </div>

      {/* AURORA */}

      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-[-10%] left-[5%] w-[700px] h-[700px] bg-cyan-500/15 rounded-full blur-[180px]" />

        <div className="absolute top-[10%] right-[-10%] w-[800px] h-[800px] bg-violet-500/15 rounded-full blur-[200px]" />

        <div className="absolute bottom-[-20%] left-[30%] w-[700px] h-[700px] bg-blue-500/10 rounded-full blur-[180px]" />

        <div className="absolute top-[30%] left-[40%] w-[400px] h-[400px] bg-white/5 rounded-full blur-[120px]" />
      </div>

      {/* CONTENT */}

      <div className="relative z-10 px-6 py-6">
        {/* NAVBAR */}

        <nav
          className="max-w-7xl mx-auto border border-white/10 rounded-3xl px-8 py-5 backdrop-blur-xl bg-white/5
          flex items-center justify-between sticky top-5 z-50"
        >
          <div className="flex items-center gap-3">
            <div
              className="w-12 h-12 rounded-2xl bg-gradient-to-r from-cyan-400 to-violet-500
              flex items-center justify-center font-black text-black text-xl"
            >
              SN
            </div>

            <h1 className="text-xl font-semibold">
              Siddharth Nahar
            </h1>
          </div>

          <div className="hidden md:flex gap-10 text-slate-300">
            <a href="#about">About</a>

            <a href="#skills">Skills</a>

            <a href="#projects">
              Projects
            </a>

            <a href="#contact">
              Contact
            </a>
          </div>

          <a
            href="mailto:siddharthnahar68@gmail.com"
            className="px-6 py-3 rounded-2xl border border-cyan-500/30 bg-cyan-500/10
            hover:bg-cyan-500/20 transition-all duration-300"
          >
            Let’s Connect
          </a>
        </nav>

        {/* HERO */}

        <section className="max-w-7xl mx-auto min-h-screen flex items-center">
          <div className="grid lg:grid-cols-2 gap-16 items-center w-full">
            {/* LEFT */}

            <motion.div
              initial={{
                opacity: 0,
                y: 40,
              }}
              animate={{
                opacity: 1,
                y: 0,
              }}
              transition={{
                duration: 1,
              }}
            >
              <div
                className="inline-flex items-center gap-2 px-5 py-3 rounded-full
                bg-violet-500/10 border border-violet-500/20 mb-8"
              >
                <div className="w-2 h-2 rounded-full bg-green-400 animate-pulse" />

                <span className="text-sm text-slate-200">
                  Senior Flutter Developer
                </span>
              </div>

              <h1
                className="text-7xl md:text-8xl font-black leading-none mb-8"
              >
                Siddharth

                <span
                  className="block bg-gradient-to-r from-cyan-400 via-blue-500 to-violet-500
                  bg-clip-text text-transparent"
                >
                  Nahar
                </span>
              </h1>

              <p
                className="text-slate-300 text-2xl leading-relaxed max-w-2xl mb-10"
              >
                Senior Flutter Developer with
                4.8+ years of experience
                building scalable cross-platform
                experiences.
              </p>

              <div className="flex flex-wrap gap-5 mb-10">
                <a
                  href="#projects"
                  className="group px-8 py-5 rounded-2xl bg-gradient-to-r from-cyan-500 to-violet-600
                  font-semibold text-lg flex items-center gap-3
                  hover:scale-105 transition-all duration-300"
                >
                  Explore Projects

                  <ArrowRight />
                </a>

                <a
                  href="mailto:siddharthnahar68@gmail.com"
                  className="px-8 py-5 rounded-2xl border border-white/10 bg-white/5
                  hover:bg-white/10 transition-all duration-300 text-lg"
                >
                  Contact Me
                </a>
              </div>

              {/* SOCIALS */}

              <div className="flex gap-5">
                <motion.a
                  href="https://github.com/sidd68-hub"
                  target="_blank"
                  whileHover={{
                    scale: 1.1,
                    y: -5,
                  }}
                  whileTap={{
                    scale: 0.95,
                  }}
                  className="px-5 py-4 rounded-2xl border border-white/10 bg-white/5
                  hover:border-cyan-500/50 hover:bg-white/10
                  transition-all duration-300"
                >
                  GitHub
                </motion.a>

                <motion.a
                  href="https://www.linkedin.com/in/siddharth-nahar-flutter-dev/"
                  target="_blank"
                  whileHover={{
                    scale: 1.1,
                    y: -5,
                  }}
                  whileTap={{
                    scale: 0.95,
                  }}
                  className="px-5 py-4 rounded-2xl border border-white/10 bg-white/5
                  hover:border-cyan-500/50 hover:bg-white/10
                  transition-all duration-300"
                >
                  LinkedIn
                </motion.a>

                <motion.a
                  href="mailto:siddharthnahar68@gmail.com"
                  whileHover={{
                    scale: 1.1,
                    y: -5,
                  }}
                  whileTap={{
                    scale: 0.95,
                  }}
                  className="px-5 py-4 rounded-2xl border border-white/10 bg-white/5
                  hover:border-cyan-500/50 hover:bg-white/10
                  transition-all duration-300"
                >
                  <Mail className="w-5 h-5" />
                </motion.a>
              </div>
            </motion.div>

            {/* RIGHT */}

            <motion.div
              initial={{
                opacity: 0,
                scale: 0.8,
              }}
              animate={{
                opacity: 1,
                scale: 1,
              }}
              transition={{
                duration: 1.2,
              }}
              className="relative hidden lg:flex justify-center items-center"
            >
              <div className="relative w-[600px] h-[600px] flex items-center justify-center">
                <div className="absolute w-[450px] h-[450px] rounded-full bg-cyan-500/20 blur-[120px]" />

                <div className="absolute w-[350px] h-[350px] rounded-full bg-violet-500/20 blur-[100px]" />

                <div
                  className="absolute w-[500px] h-[500px] rounded-full border border-white/10
                  bg-white/5 backdrop-blur-3xl"
                />

                {/* RIVE */}

                <div className="relative z-10 w-[420px] h-[420px]">
                  <DashAnimation />
                </div>

                {/* EXPERIENCE */}

                <motion.div
                  animate={{
                    y: [0, -15, 0],
                  }}
                  transition={{
                    duration: 4,
                    repeat: Infinity,
                  }}
                  className="absolute bottom-12 right-8 px-6 py-4 rounded-2xl
                  border border-white/10 bg-black/40 backdrop-blur-2xl"
                >
                  <h2
                    className="text-4xl font-black bg-gradient-to-r from-cyan-400 to-violet-500
                    bg-clip-text text-transparent"
                  >
                    4.8+
                  </h2>

                  <p className="text-slate-300 text-sm">
                    Years Experience
                  </p>
                </motion.div>
              </div>
            </motion.div>
          </div>
        </section>

        {/* ABOUT */}

        <section
          id="about"
          className="max-w-6xl mx-auto py-32"
        >
          <div
            className="rounded-[40px] border border-white/10 bg-white/5
            backdrop-blur-2xl p-12"
          >
            <h2 className="text-5xl font-bold mb-8">
              About Me
            </h2>

            <p
              className="text-slate-300 text-xl leading-relaxed"
            >
              Specialized in Flutter ecosystem
              development with expertise in
              scalable architecture,
              state management,
              API integrations,
              real-time systems,
              clean architecture,
              CI/CD pipelines,
              and premium mobile experiences.
            </p>
          </div>
        </section>

        {/* SKILLS */}

        <section
          id="skills"
          className="max-w-7xl mx-auto py-32"
        >
          <h2
            className="text-5xl md:text-6xl font-bold text-center mb-20
            bg-gradient-to-r from-cyan-400 via-blue-500 to-violet-500
            bg-clip-text text-transparent"
          >
            Tech Arsenal
          </h2>

          <div
            className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6"
          >
            {skills.map((skill) => (
              <motion.div
                key={skill.name}
                whileHover={{
                  y: -5,
                  scale: 1.05,
                }}
                className="rounded-3xl border border-white/10 bg-white/5
                backdrop-blur-2xl p-6 text-center
                hover:border-cyan-500/50 hover:bg-white/10
                transition-all duration-300"
              >
                <img
                  src={skill.icon}
                  alt={skill.name}
                  className="w-14 h-14 object-contain mb-4 mx-auto"
                />

                <h3
                  className="text-lg font-semibold text-white"
                >
                  {skill.name}
                </h3>
              </motion.div>
            ))}
          </div>
        </section>

        {/* PROJECTS */}

        <section
          id="projects"
          className="max-w-7xl mx-auto py-32"
        >
          <h2
            className="text-5xl md:text-6xl font-bold text-center mb-20
            bg-gradient-to-r from-cyan-400 via-blue-500 to-violet-500
            bg-clip-text text-transparent"
          >
            Featured Projects
          </h2>

          <div className="grid lg:grid-cols-3 gap-10">
            {projects.map((project) => (
              <motion.div
                key={project.title}
                whileHover={{
                  y: -12,
                }}
                className="rounded-[35px] border border-white/10 bg-white/5
                backdrop-blur-2xl p-8
                hover:border-cyan-500/30 hover:bg-white/8
                transition-all duration-300"
              >
                <div
                  className={`h-52 rounded-3xl bg-gradient-to-br ${project.gradient}
                  mb-8 flex items-center justify-center text-5xl font-black text-white/20`}
                >
                  {project.title[0]}
                </div>

                <h3
                  className="text-3xl font-bold mb-4 text-white"
                >
                  {project.title}
                </h3>

                <p className="text-slate-300 mb-6">
                  {project.desc}
                </p>

                <div className="flex flex-wrap gap-2">
                  {project.tech.map((tech) => (
                    <span
                      key={tech}
                      className="px-3 py-1 rounded-full bg-white/5 border border-white/10
                      text-xs font-medium text-slate-300"
                    >
                      {tech}
                    </span>
                  ))}
                </div>
              </motion.div>
            ))}
          </div>
        </section>

        {/* CONTACT */}

        <section
          id="contact"
          className="max-w-5xl mx-auto py-32 text-center"
        >
          <h2 className="text-5xl font-bold mb-8">
            <span
              className="block bg-gradient-to-r from-cyan-400 to-violet-500
              bg-clip-text text-transparent"
            >
              Let’s Build Something Exceptional
            </span>
          </h2>

          <p
            className="text-slate-300 text-xl mb-12"
          >
            Available for scalable Flutter
            applications, premium mobile
            products, and modern
            cross-platform engineering.
          </p>

          <motion.a
            href="mailto:siddharthnahar68@gmail.com"
            whileHover={{
              scale: 1.05,
            }}
            whileTap={{
              scale: 0.95,
            }}
            className="inline-flex items-center gap-3 px-8 py-5 rounded-2xl
            bg-gradient-to-r from-cyan-500 to-violet-600 text-lg font-semibold"
          >
            Contact Me

            <ArrowRight />
          </motion.a>
        </section>

        {/* FOOTER */}

        <footer
          className="border-t border-white/10 py-10 text-center text-slate-400"
        >
          © 2026 Siddharth Nahar — Built
          with Next.js, Three.js &
          Framer Motion.
        </footer>
      </div>
    </main>
  );
}