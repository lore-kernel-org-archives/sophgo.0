Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11592C08B0
	for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315912; cv=none; b=a75ZTFr7jDDkFv7hX2MFCck6k+cb61O0FK+Z4NG/WWRYwW8AM5LQWuZZY7DSN5LU+PI6JaSswi2tStEPpI3qoW1TMtRYO40uLRHj2SvkB9QNqt2jTJSpvacXdccYAaS4Ettp/K6vSEizABXKT0RaNo/H2AcLZcWNK24KkeoHplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315912; c=relaxed/simple;
	bh=+JAI9VnHIBX00B46wh31e/5xxd26d7m1SDaNEyut3Cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qq+TOEsCQYxxsr/aChUb2YbxaClws9X99hUc0TG7GY8bcj5swC+cuSbumAj9dKfsZzV1LTvgLFHAQsiP61SxMND4N1aHNUM+DeqviZNvcfhM6XlUXKToPtnJtTBkH0g9fJTy8ZmVOBd+BOfygBhFIP+lIKxvQ1WmjcBzTIE2v2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmmQocyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc3Zb45Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmmQocyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc3Zb45Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCnKXs3868770
	for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 14:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bIAA5jpDbLy42+i72oOADm6AmGYV3kdImVw7xhJJag=; b=LmmQocyzwI3vxIQ0
	6R7fSlmdKnmMSP/UUsw3rs7aFgWECrb8gIeEuPnccdNsn86JBgA+YNNW9+jWueHa
	aLdMUx3tV0BRXJf6GMCnqPqcCc7BdVpde8TXvJ9hKK2xvTmCUbyEWuMZ71Xp45hf
	5hEOv/CM4m/FeBWHZcqJfru6tOLUzT5DKWNG0wE7AB5ZTHN1d03DYnueuIofCsC7
	KJsYtbvtJlrwoLoXLr+VXr5ONU4WPz//eE3FSzuWKaAdUhAUEcjOt3oVretvLReV
	iliPTRS0AZFmuuvl14dFf++9CMSSxtYOeg33Poo/L5IpKNw0As+49FWe8/F0DdSx
	87c3yA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk9nuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 14:51:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso7452422a91.3
        for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 06:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315909; x=1768920709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bIAA5jpDbLy42+i72oOADm6AmGYV3kdImVw7xhJJag=;
        b=Lc3Zb45ZcKl4WbTCIWh3q7iPYpxSYy2U8kdP79VJe4gYPbj9vWrRtaK4333mriwB3m
         bOyptGhwaganKUqytzHMrKNn504+/LKjoRKPID0xMOoMSHOZXLcYRrK/SdeTA8Jx39ZY
         Yuymsc5zXSGKFTepHN0Zvid3tInBT+c11AHumnzsyVQP8mdF3X5r12nYV9qIrUAoBZx5
         j/hAg78Avezl8TbmUE6b09Yt4Q0ZD+MktyXnNyI58wE/tIsscnRKCzehSLf8OscA7vWS
         4jV8IqpJxxlbnPzBYECaBE2a33sI/yVWzByDYTBBI8W+VZ6YMiKQUq09EKYrpF4sUPzG
         rgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315909; x=1768920709;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bIAA5jpDbLy42+i72oOADm6AmGYV3kdImVw7xhJJag=;
        b=nhwUgmtDRPbjR/RZnbPedaDywXi+VobKWyEmw++N89cNbwVBe0zMy8Z9GlIdBzf8X4
         pWiGGbntU6Kt1uxQYbboykTzkAp0DPS4ToaB4gry/2K7/MgH3jzF+6nI6AFaj3dsg2nS
         Tpm3XnXuCu5oOGULFb6p6b46mKDxPlRiYEz6Uhtivr8IHVPzd0An/og6zV8x0fj0fGYS
         u1A30SrWl1GL4lSYrVtFBboHKtirAIcuxemH3+nnSZPseLcvdFWfjaebeIBEoWQXYNGz
         OsgyuRXxnEVTV8ROEaIDGyqn4x/KXtofo7pQZfwukhaeH1lXJBqON98euLgkjPXH53Ui
         A/ew==
X-Forwarded-Encrypted: i=1; AJvYcCWaYK+ed3D5nb+Uhwutpiv/XcmvgnrvyGmk42KmFaeRQWIshMPPSUv/2XGOSBZLoc/pNbe3np4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX2VLNNW+Vc586qgMWoXW6YzwpqFj8FmaWPM8HFPAWsvgREv1e
	aJPKVTKUUPb6tGZ6QgznGi/6Qm1vKNQTaO8fAb4LLPzmUv+reuqehYLOMDGbrf54Jk8PPPFn3SP
	KaqIcn0RLset0gmmE16RtxfPgVhvfqqJ1nLpGhSsipoPeRkVVf9wbprPdlAY=
X-Gm-Gg: AY/fxX53dFBfmfuoRh7DoE5fkWA+wcqGnrZLro5wJqdYrET57TN3wU0k6OcdVcWaG0a
	QEUAt/yqOfqEtLa/N+6nTdo5prcgMn7C0amNF2fXAytwuc8n/nA+4JXaidRrk7p7gLW+lc9BxQ8
	OUZox3ditzeMY/cULhXzYtnIK6+JY7Q5K1R3D5cQIyyuuLJ8KAphKHrOBUYmzN3FgRXoYSgYLKR
	VSfGvYXUdI+5c//0+KGhyJcWhOCoIgislbsP4bJJIUd3hVWUx0QSxQFwIUhDCRdZ6cx3v2i19lv
	1iba4NwmWL3t5VTGC//k53IeidR5Kk6c1jo8fW+s/C1EI5mPaNrDo5la6PPRenvw2KaQec5nZHl
	/J306nQWW
X-Received: by 2002:a17:90b:540e:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-34f68c48351mr18090573a91.36.1768315908876;
        Tue, 13 Jan 2026 06:51:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+nJvkNAJLGvmDDW2eJiVku4fA2nWosYNYM3zmKyiIIl2dn4BDA4tQWPsuNIqE+KRlpq0TGg==
X-Received: by 2002:a17:90b:540e:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-34f68c48351mr18090539a91.36.1768315908245;
        Tue, 13 Jan 2026 06:51:48 -0800 (PST)
Received: from [192.168.1.102] ([120.60.62.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c6f4dsm20552848a91.8.2026.01.13.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:51:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-pci@vger.kernel.org,
        sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
        Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
        Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20260109040756.731169-1-inochiama@gmail.com>
References: <20260109040756.731169-1-inochiama@gmail.com>
Subject: Re: [PATCH] PCI/sophgo: Avoid L0s and L1 on Sophgo 2044 PCIe Root
 Ports
Message-Id: <176831590431.500768.9251307274356703200.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 20:21:44 +0530
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: qTIrgezlBgXtWlsidbwpfae8G9kECDnA
X-Proofpoint-GUID: qTIrgezlBgXtWlsidbwpfae8G9kECDnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNSBTYWx0ZWRfXzkAKYwYyX8Br
 oGVuAV6dOa8SFZ0SviluU/NSFJtNHwJsGKFqKNskKbwp9oi/6yDiPKXvuJlhMhw3QvT6eI0eE5R
 IWV+4AnOSrwsLidBNocK3dzneHh5JLfawlYp1GupCypCiiHsx1ZPCEfHUYgqVIrD0WhUgxT3u6n
 pzRIUYAQVL3OT0tl03n02S/BSOPOqZQPxuWIkBBdIVpM67boT8sTYLpqXoVbtvXRncenwDWJN6C
 GjDdrRLaZeS8bnpWYoCeNAq2jwN/rh+Bnaff6+9svS104OsXEPADPsX7mAVPoIMjTMqRbtewXUN
 4a3hmbZE52nhTY/MuogOkMBP8xZ/064q1iLl4XH9AokTwbzaKewVuQf91o+0hswegsh8ghIZnR5
 792CXt4s8ZNHus+VB4LTLilCGoNcl4IfDeZbi/A62IFJo1sa75nn+OOfDSKDf2IpQkj+wGqyspa
 vuQ3tibjKWiE6JWCREA==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69665c05 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=tlgrONNCw2HA119KiuRAjA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=8rKNN5rFLlO33tCDVXkA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130125


On Fri, 09 Jan 2026 12:07:53 +0800, Inochi Amaoto wrote:
> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
> states for devicetree platforms") force enable ASPM on all device tree
> platform, the SG2044 root port breaks as it advertises L0s and L1
> capabilities without supporting it.
> 
> Mask the L0s and L1 Support advertised in Link Capabilities
> in the LINKCAP register SG2044 Root Ports, so the framework
> won't try to enable those states.
> 
> [...]

Applied, thanks!

[1/1] PCI/sophgo: Avoid L0s and L1 on Sophgo 2044 PCIe Root Ports
      commit: 613f3255a35a95f52575dd8c60b7ac9d711639ce

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

