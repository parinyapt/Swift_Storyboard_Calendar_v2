//
//  ConfigData.swift
//  assignment3-calendar-final
//
//  Created by Parinya Termkasipanich on 18/9/2565 BE.
//

import UIKit

let language_config:[Int:[String:String]] = [
    0:[
        "languageCode":"th",
        "region":"TH"
    ],
    1:[
        "languageCode":"en",
        "region":"US"
    ]
]

let zodiac_config:[[String:[String]]] = [
        [
            "name":["ราศีเมษ","Aries"],
            "description":["A = กล้าแสดงออก\nR = ชอบความสดชื่น มีชีวิตชีวา\nI = ชอบความอิสระ ไม่ชอบให้ใครมาบังคับ\nE = มีความกระฉับกระเฉง กระชุ่มกระชวย\nS = น่ามอง ดูน่าหลงใหล","A = Assertive\nR = Refreshing\nI = Independent\nE = Energetic\nS = Sexy"
            ],
            "startDate":["03-21"],
            "endDate":["04-20"],
        ],
        [
            "name":["ราศีพฤษภ","Taurus"],
            "description":["T = ชอบการบุกเบิกใหม่\nA = ความทะเยอทะยาน\nU = ความแน่วแน่\nR = ความน่าเชื่อถือ\nU = มีความเห็นอกเห็นใจ\nS = ความมั่นคง","T = Trailblazing\nA = Ambitious\nU = Unwavering\nR = Reliable\nU = Understanding \nS = Stable"],
            "startDate":["04-21"],
            "endDate":["05-21"],
        ],
        [
            "name":["ราศีเมถุน","Gemini"],
            "description":["G = เป็นคนใจกว้าง\nE = ความสามารถในการปรับอารมณ์\nM = มีแรงบันดาลใจ\nI = มีจินตนาการ\nN = ความดี\nI = ความอัจฉริยะในตัว","G = Generous\nE = emotionally in tune\nM = motivated\nI = imaginative\nN = nice\nI = intelligent"],
            "startDate":["05-22"],
            "endDate":["06-21"],
        ],
        [
            "name":["ราศีกรกฎ","Cancer"],
            "description":["C = การดูแลคนที่รัก\nA = ความทะเยอทะยาน\nN = ทะนุถนอม\nC = ความคิดสร้างสรรค์\nE = ความฉลาดทางอารมณ์\nR = ความยืดหยุ่น ","C = Caring\nA = Ambitious\nN = Nourishing\nC = Creative\nE = Emotionally Intelligent\nR = Resilient "],
            "startDate":["06-22"],
            "endDate":["07-22"],
        ],
        [
            "name":["ราศีสิงห์","Leo"],
            "description":["L = ความเป็นผู้นำ\nE = ความกระฉับกระเฉง\nO = เป็นคนมองโลกในแง่ดี","L = Leaders\nE = Energetic\nO = Optimistic"],
            "startDate":["07-23"],
            "endDate":["08-22"],
        ],
        [
            "name":["ราศีกันย์","Virgo"],
            "description":["V = มีคุณธรรม\nI = ความอัจฉริยะ\nR = ความรับผิดชอบ\nG = เป็นคนใจกว้าง\nO = มองโลกในแง่ดี","V = Virtuous\nI = Intelligent\nR = Responsible\nG = Generous\nO = Optimistic"],
            "startDate":["08-23"],
            "endDate":["09-23"],
        ],
        [
            "name":["ราศีตุล","Libra"],
            "description":["L = มีความภักดี\nI = อยากรู้อยากเห็น\nB = มีความสมดุล\nR = ความรับผิดชอบ\nA = เห็นใจผู้อื่น","L = Loyal\nI = Inquisitive\nB = Balanced\nR = Responsible\nA = Altruistic"],
            "startDate":["09-24"],
            "endDate":["10-23"],
        ],
        [
            "name":["ราศีพิจิก","Scorpius"],
            "description":["S = ความเย้ายวน\nC = มันสมอง\nO = แบบฉบับ\nR = การตอบโต้\nP = ความรุ่มร้อนหลงใหล\nI = สัญชาตญาณดี\nO = มีความโดดเด่น ","S = Seductive\nC = Cerebral\nO = Original\nR = Reactive\nP = Passionate\nI = Intuitive\nO = Outstanding"],
            "startDate":["10-24"],
            "endDate":["11-22"],
        ],
        [
            "name":["ราศีธนู","Sagittarius"],
            "description":["S = ความเย้ายวน\nA = ชอบผจญภัย\nG = ความกตัญญู\nI = ความอัจฉริยะในตัว\nT = การบุกเบิกริเริ่ม\nT = ดื้อรั้น\nA = มีประสิทธิภาพ\nR = ความรับผิดชอบ\nI = มีอุดมคติ\nU = หาตัวจับยาก\nS = มีความซับซ้อน","S = Seductive\nA = Adventurous\nG = Grateful\nI = Intelligent\nT = Trailblazing\nT = Tenacious adept\nA = Adept\nR = Responsible\nI = Idealistic\nU = Unparalleled\nS = Sophisticated"],
            "startDate":["11-23"],
            "endDate":["12-21"],
        ],
        [
            "name":["ราศีมังกร","Capricorn"],
            "description":["C = มีความมั่นใจ\nA = ชอบวิเคราะห์\nP = ลงภาคปฏิบัติ\nR = ความรับผิดชอบ\nI = ความอัจฉริยะ\nC = การดูแลเอาใจใส่\nO = การจัดระเบียบ\nR = ปฏิบัติได้จริง สมเหตุสมผล\nN = เรียบร้อย ปราณีต","C = Confident\nA = Analytical\nP = Practical\nR = Responsible\nI = Intelligent\nC = Caring\nO = Organized\nR = Realistic\nN = Neat"],
            "startDate":["12-22"],
            "endDate":["01-20"],
        ],
        [
            "name":["ราศีกุมภ์","Aquarius"],
            "description":["A = ชอบการวิเคราะห์\nQ = ดูแปลก\nU = แน่วแน่ เด็ดเดี่ยว\nA = เน้นที่การกระทำ\nR = มีความเคารพ\nI = ความอัจฉริยะ\nU = มีเอกลักษณ์ในตัว\nS = ความจริงใจ","A = Analytical\nQ = Quirky\nU = Uncompromising\nA = Action-focused\nR = Respectful\nI = Intelligent\nU = Unique\nS = Sincere"],
            "startDate":["01-21"],
            "endDate":["02-19"],
        ],
        [
            "name":["ราศีมีน","Pisces"],
            "description":["P = เข้าถึงจิตวิญญาณ\nI = ความอัจฉริยะในตัว\nS = น่าประหลาดใจ\nC = ความคิดสร้างสรรค์\nE = ขับเคลื่อนด้วยอารมณ์ที่หลากหลาย\nS = อ่อนไหว","P = Psychic\nI = Intelligent\nS = Surprising\nC = Creative\nE = Emotionally-driven\nS = Sensitive"],
            "startDate":["02-20"],
            "endDate":["03-20"],
        ],
]
