Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F393093B2
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759831; cv=none; b=AfM42BrhU6pl7IaII6Tev/2uLk73iCNdmL7GlgHUt4aXIwRAmjNikSxYT2EtbGzTnHI9Dq1yvBunAjTqAkqGcHzp4Frt7tNZICliMPP0eClNcwBZkqWhCKYvR8rBekdXpDZepywrUri/eb9J1VUzhJpaEPePSlRZ+CrFruPSV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759831; c=relaxed/simple;
	bh=xHpKv/L+LPsJ9X96+TG0TkMyLzJ8lmjqPrbjckpJnLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1p1jx5ZWkNENKz5CxqI2woKhKPo4vtkp4Mq0aBfE6loT91dRBSR8QzAYcsGryZUegFewfVt95tSsqK8c4vMkX5CmgrvbxWA4d0CX5daGMxqqcVfFw4qnRvfzzoBxyLgkbB6VcDbIP4MX0++6yXpNKmS2ynKMLiCh0JO7AsNGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6DB2YhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dr5hOXff; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6DB2YhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dr5hOXff"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I1SmSf1945939
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=; b=Z6DB2YhGkaLCOu3G
	dvJzrF9MGYlT25uf4akGK2B2DlOvGRwGmJkrWOY3hzsMZ9UZKt9Edh/p9bkWGcRw
	ajdURbQ8XtREwXTXybLIEXImTWYYnGNwOm2JsNhQGOtXgrTJfP0JCqqeKjwLBLit
	VU7tDcy+orbSwYYr5ZET5qJ/GHTAYICe8F06wtnrAv9XQ+ZekQSdskicVPmsod1j
	jXwEuDZ/7cpau5lyz9sJ3ZCk1xTKJju3RqwxrwYerQtNGXL4GV9TsZEV2RI6HFgM
	vUIkGVwtgZpSNCspbZo8ypNikiv8lENoW2W9dQ0qDWgj4faSZJsRXaFDd7Up2NXc
	o7I//w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36darsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 18:10:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso397160485a.1
        for <sophgo@lists.linux.dev>; Sun, 18 Jan 2026 10:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759825; x=1769364625; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=;
        b=Dr5hOXffavJlNfrZDtYiwxtlm1OcuQdAjAHBNNOOGIGrDl+ZmuOvk2Cqf6ArVOj4Ag
         yUfN7aan9Lm+RbUunpaH0HeourDhGD3hPr7PC9JORl7E3lz0UqREkTHOMU65DR8fa9W7
         m5AW5YL8PgUBQffOELDTJs4QP7e/QC0bIWktEF4ov/jy8aY3fW7Qk5dqhvT5fHzTwISP
         HXZ7vtOb3tNVJjF+FtHC5GYkkNwwdeJ7dUmVXbWq56poW86H5uyJiaJWhoqYRl8ndI61
         Aktq63MqxvyJrP9qxEsccDp+cNKriD0EvbnGpN7QF8hOw9vA/fpakROPJ2imWpjzk90z
         BS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759825; x=1769364625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UER+4Rm+CTn1fc42ps9UZK/VrM2V9tBgnOrD2NvWQKQ=;
        b=phGqThGqwipmGToQveQ3I/bpN7T9ahJi56iWDH/mx9V8S4+6L3P2IrCKSzwKHgw4in
         DE8Tux+ZH9IP6IpTVu9E6AqRLUxZ/d0sWLuX58qQlkFcgljVuO2dAjzX3I1yf9hFIT2S
         NvS2ufueLbgbWvSd1i23MNskLjjAPdTpvJ0UZtjSFEk4Xb9HSPFPdtqojHLk2gIXHWNz
         3IF1Yftp2PtQgb0xEk1m6IvyBtKlLd+z3EDTN6N7wlHEwWGYeDBRomVjloU44A7bAqRZ
         cNKXlrnddukxEEpUxji81t8lia1QWxrOZeLpUChizn6K6dxFCR+WEqEJEarTqBPThksu
         GOdw==
X-Forwarded-Encrypted: i=1; AJvYcCUmLe5xxFC68O5zF+hTQRGEox/7dupemY19EVNrmRYKSywwNzHdrifYc5vk0iGjhnj2m1zALXs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4jk7gWv58S72PEsDv59jmx5X6idVdh23CMrHLrZSWr5MMY7J2
	+xzZmZ0d1ag54c5kU6mhXu4i1Fbw2x5Q1MMMxzcpkEKHW+XkwO9VZLTcyO83O1UgSH928m9TOoy
	aZFu40RHna6nskeOM0k6VssU7+Jz4LPHfXswOyiAB+FH1KXtbjfaIymsj92w=
X-Gm-Gg: AY/fxX5KSf+85fXLWhq3vCj3F4rPjFClB8Q97FCBNWC+LuhzXVzQB4qwvu4iE6u1pSi
	ElrxkJ3+ptHXsl7E7YteVvm8SCE9gMe+Y+NSQtq2JaWhEQ6oo0Lc/yKnXoUZ75bLRgmfaWH3eiy
	rqeUkK4M2uZowWkce2DAwdZG/NAQ8dsvfK4UZxfg0zBteC78mN9YyWLnDzzvnrGJAaXXKY51Gak
	6MBCeetUQNWVPXrknHbpCIx+AXOI5YGNu79/oOYXy5ArNBDIj+ybEcXGmFbu0YCp6XGZoN2+LH+
	6Ef4pqVcWjGHYgV0yoZwnE2kqb0kLwFjhSGtjLMTQZqccOsHRP/4mh1Md++2MKej1IzbvuPbNdh
	WVuqVFVU+HJ9F7Ntps4wVHT0bLwbajrvY5w==
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1679913085a.42.1768759825046;
        Sun, 18 Jan 2026 10:10:25 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c5:3412:3aa6 with SMTP id af79cd13be357-8c591a1d06cmr1679909785a.42.1768759824643;
        Sun, 18 Jan 2026 10:10:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:33 +0100
Subject: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xHpKv/L+LPsJ9X96+TG0TkMyLzJ8lmjqPrbjckpJnLU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH2V7HCVVZQA8nE36OlRFJLPIeFm2jrQH0SA
 voGEok2auGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9gAKCRDBN2bmhouD
 138DD/9yYDuntgcWTSxWPvfXFutn8XLNtbjiww7N0//+LCDsOtjjM92dz6ezguNQS/QHM98IHRr
 SF6pn5H3zt8atlHdhCPpyf3x3oKRSwOS0Akm92SgBtUpRXGuMiq+7O2MsLdR/tIUF6gTEgn6yFV
 84Lk5zDvgwOi0QlMHAVQZPovb6h/vY837EVCDSRCFQDUTEAR7na7JozMG8tp0VE0mE7bIWwPT/f
 v6lwP4dm5xYRh+B6HzZmHXrpwVUi9RbgeRK/PNZNadB3uz62KT1T0IT8R9nZUQtX9G4FMRwD3xH
 P5t30O/Hz6it1xvrvw1Lu5f3+AySnjjr6MZxix/zVD9DGKJE40H8HH7zTSSsREL4FwUU8zZS7HX
 dALPTXy6us1q2unNwiDi6kI/AVXWCCZ6sGl+XxvmbSBYYbIWREh+WyDt22jBLH1KeIKQYb7jH64
 SyxqJFMRWZNJsMGxf5H4BjA+NqW9skDWnXCNH2FnpIxnCtdb32i8yyU24YQcB2qy+UqVOj/UGme
 M5VDHJie/HU+5EggRTKsw7A3HWxLO/5lpq8m0Aym+vl3+6ldnGSTLTfSdS07z4/0Eibgnw8tPUH
 +vVzE2zpO63gAjhez3qAdbhnW2A7TSbUiCJyYbYcgetBXMa20Xnn0pQEThXHPYBZKIK1KuGnnf6
 /vUyVHqLHNNxN8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MCBTYWx0ZWRfX4Vzi+mmoOoDQ
 XMYFLlQxZxK1MzhpCn07ABG1u92MyMw60K9ZUxytYLFvnSpJDsJqD4EriCE3NWjdp/KZvtCyM1X
 xuIK+8XZluQbm5smUqC0/3bbde0RSexfKdmX83p94fN5SychYfeAei+oLNcv1ePZgDfRsFszrxo
 6aSaLmr/K5ERn7zaJovyI+J/uBomLO1TJi4ZovAe/rkdT/tOwiihMu60AuJE8sJ7eHNBH0J53cZ
 dMdP6ih9kil7KL8AX0FDL9Jb7BDD/4vx0OoU/7WrQKX60P7jAi9/w9O7QrxjtovlZ5s4dbGt+ZI
 p/6vr2f93ligV0ZNf1xCmbSqILrnX0Hb1IRpqeg/V5DqhO8eefcJHnn0aolbC+nVbyfdfjEZkyD
 KVWqtbnnk9jqYy9PAbhFEZnqGamHOtBViipeVTbAbYzC5/fSLmaGGwo+8uc/+sLi09Gw0olmqOl
 wMMx9ILuuBIxcl3GiBg==
X-Proofpoint-GUID: yECoCU2puNgoe37WfAQPU03FaY3k4IKB
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696d2211 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yECoCU2puNgoe37WfAQPU03FaY3k4IKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180160

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..bbe1cf712965 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * The lock makes sure that either gpio-probe has completed
 			 * or the gpio driver hasn't probed yet.
 			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
-								arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
+			scoped_guard(mutex, &bank->deferred_lock) {
+				if (!gpio || !gpio->direction_output) {
+					rc = rockchip_pinconf_defer_pin(bank,
+									pin - bank->pin_base,
+									param, arg);
+					if (rc)
+						return rc;
+					break;
+				}
 			}
-			mutex_unlock(&bank->deferred_lock);
 		}
 
 		switch (param) {

-- 
2.51.0

