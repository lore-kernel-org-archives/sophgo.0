Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827C3A0E9F
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404644; cv=none; b=bMd9RsGe9ea3dlDVfWYOoSDPii83cgPeyr3kjAWsPGt9gH2BCiqCyK1uQQh5UwmIxEhJRYZKfYIdLylQw4JBmcSRYWAjfJSOJL9EDj+HklbcAXDgJW/wNJjCeshemyz16DPwSLDKkwIBMmAU0j9J3WY3A9iq6Zid7S00B3tRGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404644; c=relaxed/simple;
	bh=9+1hnIFGck3b+xQzUfQOk+LUFT1gQJKcE/unZtByYAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lY8DZXXoAcBV5qZaxx1vER+X81Nwwi+qvZfzTmR/5vZs4Z0P0Pe0UckIv+RFnzQ03vem/OGDOUGVbVy9KiHEvVIIpYFsRS0mOXz/CSsjNifJvEdLFzFhf81cT74eVjYwYgeDtp71iNa5AUHifdrgqU2HP3fg8rnyQINjOM+OwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0gmla3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/AbGerf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0gmla3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/AbGerf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EE1D3X2498183
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=; b=c0gmla3nEwW1grom
	dXfhMbs2CUA0nDw7P+mN/FxD+dkR3rvaLg1kj3Nh9uN83L54wADzxSvhai1Czh3o
	2Z4/Gt1Ftvc2cgOWr3LZiD7Uq4ypjP8ZT+7sDuhbqb3HYJDQpZ7OrzIf81BX0H4J
	lF1mR5L9zhlV6RdlrxyvfNJjXvrj6xgubK3JL0usnUC2m/6pPMzEsOqSyd7zVVdT
	uZolIq0Q9qTwubXeuXWTAJbOaeGgW8HmvOOKNw2Z3XPfK7RiY4Nd1H40O0BGDa4R
	EQ1XpTh5M4lrFkiSZ1EUhg58ozURytLvOpuOMTchVUUu0v7sRbxOU/92dxJcw1iO
	O68bPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x2xw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ba026720eeso938079185a.1
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404641; x=1769009441; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=J/AbGerfgxrnhZruh4xvhb8O8JTfLuitwkx8QiytqfJTHT6anGy4YFy3WTlxybjelW
         uz7eO9SUNERgDaB+luKI4LzciWeY8/NEKppJ/pDT9/f00fb9p+8EjSJw3N3CmZwaZk1E
         OBsKrRkpPRyK0i8AGhaiMpvFU1YsEilyvq0Jnssr9WEdmupi0m8vEyV/7NL+L2aJXZBH
         MZzaHdAmTRepJqFLnUk8uJATabul0NdFxiD7PSiN8CTY5zAy3LBlDRMTVsfMgRo2An0l
         7LZJHjXHY7Bc9RIjCf3cckFUWArJ0DDmd1DqjdGViNzODIsqYmcjE9Z3fCSlyF8mf0i1
         a13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404641; x=1769009441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=H5fZCodUblO9rB07yLbNORmv+96ZNR+ENYEPm5vYxQPOEliM2hqcthSqO4mquQd8f6
         Y6lG9wNNKHjT9IKqTQ1+xGBLeV3CG9JjgS2QiHAqu3n/x7qo9xHHmei3uhGVxrVNrvQx
         DkpAM8Uu3bPKH3sPQOk+NbDvst/Z0AJ8F691KBbERJkhRzHN3ZK9mxSwY+uIIijwQ+JC
         dbUF1cYQDB/eLf6C89tyrxtx0MVe1H9/kPi/u7yPxFiG94mMZpeOF89ASWzgQsEOujOi
         NuSTFBXTIN2lpNK7Bx/ZueY2Z092W5Z4NEykzS8Z6MLc/+QF+R5MjJyDaRaB8HcjSS0m
         XszA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZgsH9Lfu+GcOUP51v0fUqXmQVVjmukP6CKSQb3V62zTu2MHn7e/9QrlSDU5Xqk46YOAsN7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfD4PHhSBkM2sEV+E9JaS1oAFXymRGZb7im8o4+IcKDJlQCd6R
	JS/j4rw9bIjXeQdA/ztAribM4+SnbRXT7QUJtDs0xknxW1FOiX4THroHwPWhRT/fhtRLwqyTVhy
	VT7c6uImgpw36aj+lzx9wYuaFoc3d+nl8LNjsLiwimQ3OYq9s9y4yj/a3WnM=
X-Gm-Gg: AY/fxX4K3QslppZi995DQ1DsAkm0NFqOnfv4nID3PbOdbsFKXxURqMFtGj5uzeS4/ZU
	sIUw/Ih0xI3MYK6LZBi+E1lRag3LB7Fm6K/+jsnym8QhsC80RIbvYy7pMxA22OuYd6unQq//WUE
	9+G7DQs9kWktDKJ6Xha3H5IuBRAf99RBpSSHaLNUTt3zeJCk4FWM6UWcXJVXBCW6CYCioKks37t
	tV4VeWoOLGMvsf+ckPC/fPAM2/2cF0NAVuGxIQdFcU7l6Ppb0Ggt+fXp9jkx4xTAYnVFYwyAV3L
	FbH7HjixCbgSz2eJ9C0h1v3/w7ZRtNanmIGK8z8Vvjo7WxGIH1p16x9/pEuazaRYTPbIs/5zGZA
	r5pzufiD1C8kQ/GwcEPmIKmGq2AVL55i0bg==
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311805585a.28.1768404640524;
        Wed, 14 Jan 2026 07:30:40 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311794785a.28.1768404639752;
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:11 +0100
Subject: [PATCH 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9+1hnIFGck3b+xQzUfQOk+LUFT1gQJKcE/unZtByYAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aIvjtMFFp1u5KZIz3s1rXIH/N4W/pA1awz0
 axCd4PEfTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2iAAKCRDBN2bmhouD
 16PJD/4udox+AT0qW++6/oS92v662DKt4vHflxhkYd1Y7cNFl6VsgBSRfzaoloaz0MEHOAVFGMt
 1UyMr93P+dS8fvc4VILacc5vZbJ/kr00OTwdcwQvdnsePTgGSF9jxGxB1yMVKlFjDrLF1zPkwpl
 29wGLZ37hS0UH0TeGW2udTIV1YUSrFiYFUZYsEcMt39OwgRdby8TpKGWJUjQxIvBk+/3xZOt/e7
 NPVy4lUSbhDTBQIXlTFIVTRce1yycOyBjEl+kvd/FhG6SHcCL61dVRC/HGbXL0M/wiiofXEdasR
 r9lwXPamriRLmuyjJw24hnarxswAqVCniTLhEcripalHasg+sQl3suIahqkaLyitP7Cnd/tzwbK
 +0IG7HVcQKU3c99Eb4MDp1+DQhaoB7hYCDuhAfVj131lDaC23kfGy82We0gW1UU3HljSGp/099i
 9dIEF1tOdwQ3Fn8QJ63QNMNDQrnXvvHNhKtSsvxkruUtxPw5PxcVn3TXp4E7SFojcFSU03Vjr6P
 1PerYKudeLt4fYL25YhswZnxQ55f9YEHdXOpcT6ioYr1ADvhmpbxvYqiutI5oF079O96zENLJW6
 XqeT+zpnIQ6JT3SXsguxvuciBugFqYtmWU6xsPv/UBK4NLPnIsNYRhMDUmDpn3uqmgo9awP1tGd
 9qrQnqhwTfT+JiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: q3lMllE3ozSwuQURA-7ftugV_0Stff5f
X-Proofpoint-ORIG-GUID: q3lMllE3ozSwuQURA-7ftugV_0Stff5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXx4dQAOMD2IUF
 q+5BQRXBmAsMIAz9mBHJDO+XDduiCJxe2a7FMTGHBAehpvvRZ/avzbFxhjqWslhsDJL6S6ojkEl
 R2czbwVOetWNI5nv1/LBNE58VSNiqk8bWv1Cedq9y4Q2asNTml6s5PA07U6TDSqmpV3k/QZKk6U
 Ka/R9gS4gfIc5mIF92CxT/iMIUX1orpgf7PylTjiECRYrpl2dOZZtE8aPdGBa30Q/bsRNl8muSs
 Wb4+8F1nFPVw1HFVs4duDq8GWm6FoPlrWV72YteeKBEkpNwUeNjHIa/G8732ejnED1aKZBuA4Pu
 NhZxDIZq4ML8mlikCw/9Omim9fqP9fztSsLXXAVoUAHwyrj5/bRHSWSunYaKjtOUHFYN0ktOEBh
 9JjMvyitHTuZyoLShF+j074eUVi2wga295trj23HAeMlxhNdNVPEBHgLXNKYiSn2nNzriHJf0P5
 0Q442PtIxjkyGn/hgFw==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=6967b6a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140130

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

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

