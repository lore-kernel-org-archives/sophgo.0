Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B023F405
	for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 06:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105015; cv=none; b=neRQSu5lQkEWKQoOfddxDjk4YPcO7g03TqjUd431cGSr+I5J/Bt8ZBbonsXin60eUWXu4OweoQBfkT17TZo0MAoNIjCUTho6DsqDqc4lIZWwnJeR44n0l0HpznFtE3wx3MFlMvLsO9acq6iLQ9KFPZh5Hxbs57gKapFZI7SijyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105015; c=relaxed/simple;
	bh=BhPG4H+I7zDs8dwab76+BoAR+ozvEKZSdpitJSyJUkw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dk3pHzGlDCrVnpwBl8A25jVcgtiugA5RzCeWspHT6DaqkkQJFAdQFEAiLhGP4qgRRgY/MGkzwzOJcJ1+iRpZzTpX7bK4o/e5op7/NQcOUAIWr76iimvAUoGQu+4Vp9T3a2NyT2sZrh2BA6nfPEr4Pk+40sH4RntsJoBGPd+bAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvYSX9CR; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvYSX9CR"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-30cce90227aso1313560fac.1
        for <sophgo@lists.linux.dev>; Sun, 24 Aug 2025 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756105013; x=1756709813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=EvYSX9CR0VKSVivZfe9jwm4u28/AA7Lww3hzlVYe6sRLP0gKS7VVOdknChg+G6ZEf7
         ik8z+m7vnRGW96N8YNheER9oFW9G46ABlATfPJGrE3dEUSn1jP7MMfJ5SwanCQ/U9A91
         Jht5RSF/+lYddpMIVLTct9ZwiKu5QiHowwSqx+vlwNkEeAG5eHZAHAmhi734QTzoOZ1Q
         V10aEDp447ofJCwIp5OMq1P5H6ctSMiPvv/qu+cbZj0KFKTJrPKYeWn1MoW5L/0TLNEn
         BXYc8SFzDKWJ1+JxDR3PF7Zc0l9ensrxOE+KSwq4IkGjKhLcvLRU6E9ufOfyN7sKg3U/
         M6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756105013; x=1756709813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=wrJ3eg9J5vvx+2PYxtrpx5AlUyAN1IpClZ8teM8PUPfnA+tHvNqgxwiV8W6t8DUMhv
         qDQzAylDZuBY30HhLFuQlAZardydLDnclg8+HYgy465GvVRcBHX6PkmsaWsge4YAShLk
         HbsQV0rnVJGcSoaqcbZxAWXcTIJfh6Yl9KNtLWK/mRmM6NBtV0zAMVZZVrJyckotKd0R
         yHZR6CvFiaHDrSmL8GmpxdrOc58kBAecMNYpe8n0rDd+DXh1s5EjPsLgi1VHBptWJlm2
         V3APJHhHcCk+FWTAv9ubBNbEX8G6+c+cNEPMvIzqYR+VMI09ouL0FmqzrC1IiLZ4hgHo
         Z8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNYFgmuON8JdvZzbSSIz+LBDmYAp5fNmHxRd/ZISD8DJPi/HUUqO0QSCgEjm3l597J9i3/AkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLp+/xA3PBEtD0asSrRKd0GYmKJ9TwOircsRXnL8v9+3JfbqKq
	HwERbMSvusrlBsWeylZsjmpJ/vXD7FUHxQJAlgwqiE0syPglQ6fnlau/
X-Gm-Gg: ASbGncvsJvhBmtLnkDVG3HDNPZiLL3r1A0xK+MG+ThW4TSf85cdYDkQf3f9EgnbawuF
	E74RRIPPAEF3fZl0LAKAV2O3S681ZA4pigXrNU9EwZZhi6A7TveyXJfNkeaxx2Lp7LVnl2hR4YX
	aE6gZyiXdIF1nrvn5JeEiT1SE2I6Tqbq+YQYP6I3cMMDZ1gID96qASEV56eY/Oq535QU2h78fqN
	hxM15pQB+9FycXhhUu5Ku8NdllniJmr6Fa7gDbwe3Wvn6gw0NKjQ3Zdgtzd5jP1v962WTDF1LBz
	x7FTBFIHf3bn4oAnGh9BVL/CEBERXpZ6NM2e7ahH8Wq9mDcKxRcEk6iPbJLAeI7Q+2W1rCHPoZc
	7ou1svKD/tPXqa0iB6hT9+zFpNc4XnO0l
X-Google-Smtp-Source: AGHT+IE4S8hpOAZcHJoPilZ7mmplf7IZel6cvlTzB91P6LUa8rKsYKvo/Uiar7NnssN2qnxAYRP3Qw==
X-Received: by 2002:a05:6870:1698:b0:314:b6a6:68aa with SMTP id 586e51a60fabf-314dce1b218mr4807487fac.50.1756105013383;
        Sun, 24 Aug 2025 23:56:53 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7a21bdfsm1630481fac.8.2025.08.24.23.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:56:53 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 4/4] riscv: sophgo: dts: sg2044: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Mon, 25 Aug 2025 14:56:44 +0800
Message-Id: <a0ddd70d0658a26a24a9ae48d7ea9e59dfd7cb6f.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6ec955744b0c..320c4d1d08e6 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
 			reg-names = "clr", "doorbell";
 			#msi-cells = <0>;
 			msi-controller;
-			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
 			status = "disabled";
 		};
 
-- 
2.34.1

