Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D53195F0
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404623; cv=none; b=mbQjW0b9y2C6GsFawznU1bwmmYY8wNm3uCCcq3nkWoyZhlC3UCUVOcQSnD4sobt0pjV38AV/vv/kFzE+y8n2yQUhCUcn5YokErdqiKVqX90fif8uE4hzHpFT0iV0Ewa5kwWFxNmH+LYSNiKM6hMahu+YSNGikIUVhTQry8ndYFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404623; c=relaxed/simple;
	bh=tLBiCjBbWlHcgxWjXHX4vOwOt6z6xjKJRXQ7V1ntRq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMvbrQfpJ/XIrJSk848gaZ41aDH294zmxHlR73SgVR/mrnsFAQYl5andmcUtGhppeqxsrzDXoTQ9AXwlhJBG+kFWQtpsYgRVLMh7zt12b402AWeJZ79EOxRTdX2v77c02lnK72tgih/qwHknQWO83+sxLgMCNNdYp20q0r7OCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGUJ1khm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRRaWaBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGUJ1khm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRRaWaBv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EFKC7Y1942998
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zNI8uxvvQGPR7l+L6hMR3h
	W88fE85OfdP454JvvhgWA=; b=bGUJ1khmgcJ9EcQN5yorfHm9s+OEbsZju2rlty
	Lb3D9jAp+XKVslxi0DlfIDk6F/tNu9d+bxU3KglSgYVqy+OHWQ4ZRo6pzwz6flrW
	T8knj5aB5CmbHJ7YELKzsSBWgfyS+N/1LKOdgbo8ZtxnozWBYszthopWey030LcS
	8RY3mQpE+FWYZtJ+3l9uxAIkjSPFDe1Zxo6tr0l2ldB43dsFLw5wpZXhMB1fbn9w
	S3ZCpTYmIJlahpENM1qLKu/SfI2kNiB54lRWVtBzOcgkk73rTLxFz9a1QVuhm/Dl
	xkMMn/POsbeEhWbkLj8oHlHBQRv5tIzVgZna1ndw6CUOnbUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6sjnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:30:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so2333618685a.3
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 07:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404621; x=1769009421; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNI8uxvvQGPR7l+L6hMR3hW88fE85OfdP454JvvhgWA=;
        b=HRRaWaBv+qqKCc9BUyADv3niDCT2gZYEz9hD5DHbBmjYleIfkC1zTnsvSWLktETZqK
         si67H1WIYNLEUof7d7rJfhZGJR0dCex4dkred7jD4zzbDtlIXsNj9Ce3XY36d4VPT5P9
         rf21ShKFoWIwKZ2qcGFrxsBMFajEtAPoH8i3LO22hKoRVU6AM6HWtCWNmEYtw9OmwMdw
         UuXD/9FMI41cxze8v2ajC+f7Z3LVMddC4ieauC/hKYKsaosIxSbyFI3vBDHT+jZChxGR
         hnfGC0ODxIfx+hz4xQFB0IpHc2ihNgd5TlNa1VuPo6iFwbBQLLQhMAUfZZHaKUb47f7/
         +bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404621; x=1769009421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNI8uxvvQGPR7l+L6hMR3hW88fE85OfdP454JvvhgWA=;
        b=hC6GMqb8/ha0rNw1hXXhKilDCswfGePVOTxVL/sz7aA4/QY91AH7q8xVCsDxm7rE94
         N36rj3tA8J/vvW7JCaL73cpXhp/3E5NeiN4K9j2P7xO5wY3SphJ+vjcZTwweWxc77sDL
         vuy3SYuo6f1GYMnEq+leCPuvtJJYkt2hl16+SSS00BAwQQqtfrKwaBJaP7/AWqeuiUSM
         lE2aBtZu3liDi5HHXS/Aw4eMFtnPGqGloCq1bomuwkKsSCn/Zyf2lcD2KcFWufYY53Jm
         Tmz4iPMPPi56v6LF0OXHprb3wKkRltFnQG8bhpoFfN/t4NowI5E6EizXqlgLZo+fS5w5
         4c+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZRsamwxmMdHXO6j3vZsoDLQysygYtdq70f1p5puXDXUv/qC4rMvj3ErLfiZ8Q9l9lZHy2PQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFaRbnJZm1peoSoEj1IrMHyfTHXnRLFJmvcK4bk+1IB51SjwSn
	h+W2rwh+kmpj3CW3l0tI1eXa0KgLyj/gZfQ50j5goTmBIqYX8BPD95cwKCsoO17WsQquQuuOqMs
	21IDnv8OLKB2BDvducOK0KCiEvz7FbaJtetTBf/H2rvDur5WiM9l3GfLJopA=
X-Gm-Gg: AY/fxX48PqNP9sJDGxepKBnBEue0PKF1V1y1b8tM7VBmO83da0gZuS7fonpbxLWcnOm
	v6pv4MqNoH7pq84CWO2p01ju9qZMg9aqHcH9AGKGJxQoD0wZoW6k86Olbsa17h0isn+KRvcAcLg
	q1AY06Ikip6Us939pG3A7SbCPJt39REuzlfj7GcSDwaP65u08rAIqR7NAHjgpOSNOPO/ihCHxvP
	80SqmhUSviZ/kBmG66F2aYe3ts39h7MQZyidkhVCwnUfs4XkZYSwQvVfo2fbEiPU5+Ck1uW2zIs
	AbQ6gPXJCDhOzk05bEjMg4RqYdkAQigRQ/l7+9UFYKl3J+uNw0Rg6mVRG9ux1cB+teRHednk1tz
	9I2GXYwMvA0F5/iNvm2qUqLfVFp1bxW9gQw==
X-Received: by 2002:a05:620a:3847:b0:8c5:391f:1db9 with SMTP id af79cd13be357-8c5391f20dcmr14319185a.23.1768404620700;
        Wed, 14 Jan 2026 07:30:20 -0800 (PST)
X-Received: by 2002:a05:620a:3847:b0:8c5:391f:1db9 with SMTP id af79cd13be357-8c5391f20dcmr14312485a.23.1768404620110;
        Wed, 14 Jan 2026 07:30:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/11] pinctrl: Some code cleanup including guards
Date: Wed, 14 Jan 2026 16:30:01 +0100
Message-Id: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHq2Z2kC/x3MQQqAIBBA0avErBtIi8iuEi1MpxoIk7EiiO6et
 HyL/x9IJEwJ+uIBoYsT7yFDlQW41YaFkH026Eq3lVINRg7ukA3dRjacEZfTikffGTM1pu4m3UJ
 uo9DM9/8dxvf9AADMOgVnAAAA
X-Change-ID: 20260114-pinctrl-cleanup-guard-d899b4938b26
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tLBiCjBbWlHcgxWjXHX4vOwOt6z6xjKJRXQ7V1ntRq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7Z8TMKf/lfFyeSTM/M1j6XDCA8Wp6BUF91D3
 zO2c6gUYs6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2fAAKCRDBN2bmhouD
 11rAD/9G7/7wEMdhg+g+wsJ1qK0dlmT47qpvnepNPGBn7ulx8w1XXqWYZeMcUV3FqYkM/unOBfa
 /j/f+2SCaYTpvr5OTtrEq7gvmvc4i+xIYBmtbmXv9H+iTOIdfcRsTdC+1Me3hO0FZbhSn+x78NX
 MA78rctIdTOmORwQNbwl7TJEJfBx+MOrkfqaWZp068wwqTLUMB54TjlYM6LVM/8Xt6QOfVuYNnH
 oJSuTXAIbagfach8zvzaZNHXnzMPpQ3bl5lWuvy5GdHMrGTDCcmqa4P21vttOAt3vBPCQbg+njL
 GNRtUdPsJRkYcxug4R5mgHlDzHIHA+mT7Q283mX/Mt0AEiHOCvXgBX+QuGDJoD8tUp6wZBP6SQX
 5oK/NrxrZwOMrkOA6bL6UBm+Qjwsgn6tI8SZMiRQTRqMqMs+mk8aUWl+8lxbZ5E/wfLRDted2Ne
 cUJuXFvtbSaeNk7uUIB1a4odcZbaJeGdUGrCH8Co7/oCNMC9peu+0mKGzSGhOELAFTmpyXIoJMD
 CeO74gOAXocQ06tFzgACu4A580TuPDmGDV1CmHZBWlmAqp9H/vU4TkCvu/+OYqnSEfjNDWE45BW
 FZHN7/Hj9kw8wuNGaSc72mGkc1TbSjsidesIUPZbPehH5Uvi4AFMTnO7fSdrwjzVtOk4cah5WMZ
 HA4140yD+lkhxJQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: gmQj7QCMMAshXpjFe6Dgt-04iLaMCWqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX0i047yGGZpiQ
 eaNEgMXF73E8gORojnYhMuI8ZaVU1oIQRgQEusgV/eLPHuiWZJMSdK16t6N4mkPEb+S0VzrtoFn
 0sV09TZOxPiPMLnlUIQGcQIbIbGhmFEsJ/sMCjuaVng1TO+GjEIjKZ+zFkhlewth18ordB9xQG8
 SxG7FWoaMDnNADtzEJKqyOBsodNJb7TvRen8g3Q8PwMTHtLhXFbsDwZJYYoGtmXOirEE1zwFYke
 bsO5kx1jpDoomIcZOXsAsHK/qAe7F6HxaBMBBClXxfoeh2En0cnX4E6f4NDvUtlFSH2uI74v0Gh
 xFypLCGqceSPh0dVP6ereRNzN+Jr2IGP30skMz2QHNgJ1VKjE4sq+nVzI2F9R/q5tKrSRMchEyS
 SNtiilCAc5b75BsRxOyxRv2puBguIr1C0oJ8OQwHViCtwtOVirYcYbI3g4A0EfOWf7Z0ByC6Qh5
 ILVYHOeKEYe+g1K0E9w==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6967b68d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sUpYk6MsUIlSHpXyxe4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gmQj7QCMMAshXpjFe6Dgt-04iLaMCWqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

Few cleanups - from unused headers - or code simplifyings, including
usage of guards when beneficial.  I did not conver cases where guards
would be mixed with gotos, because this is discouraged practice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      pinctrl: aspeed: Cleanup header includes
      pinctrl: starfive: jh7110-sys: Cleanup header includes
      pinctrl: sophgo: Cleanup header includes
      pinctrl: amd: Cleanup header includes
      pinctrl: aw9523: Simplify locking with guard()
      pinctrl: microchip-sgpio: Simplify locking with guard()
      pinctrl: tb10x: Simplify locking with guard()
      pinctrl: tegra-xusb: Return void in padctl enable/disable functions
      pinctrl: tegra-xusb: Simplify locking with guard()
      pinctrl: rockchip: Simplify locking with scoped_guard()
      pinctrl: st: Annotate st_pinconf_dbg_show() as holding mutex

 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  4 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  5 +-
 drivers/pinctrl/pinctrl-amd.c                      |  2 -
 drivers/pinctrl/pinctrl-aw9523.c                   | 53 ++++++++++------------
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |  6 +--
 drivers/pinctrl/pinctrl-rockchip.c                 | 19 ++++----
 drivers/pinctrl/pinctrl-st.c                       |  1 +
 drivers/pinctrl/pinctrl-tb10x.c                    | 17 ++-----
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h            |  4 --
 drivers/pinctrl/sophgo/pinctrl-sg2042.h            |  6 ---
 .../pinctrl/starfive/pinctrl-starfive-jh7110-sys.c |  3 --
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         | 28 ++++++------
 13 files changed, 55 insertions(+), 96 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260114-pinctrl-cleanup-guard-d899b4938b26

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

