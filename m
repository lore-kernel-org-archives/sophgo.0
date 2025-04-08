Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742FA228CA9
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088552; cv=none; b=BnzlPOKbYyEfAI04qmzdjKDYYpvrGERGQYXr6TuMLN6N6kyEZByDb7wjfvL04v+s9Ng9IXzAajc8utCBspF0wLHQG9kqUhRzU9Rhm8xnXPUKpdLIXuG3qkbq0EbwF/EuOqP7PDzVlUhBm+uirrFzLm/Z2DIxJ7Dh435vrG3qXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088552; c=relaxed/simple;
	bh=LkOhOos6SsTIWVmokwBKQK+MCR4inwBdNq09QmcdbXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAoXkrRuqRvIhCCSNK2WFkGFfwtMVSml1uKtJG+0+bgUj3PNa4p4c2fuN/Lg+k4SS+3py8SC1/EKyinJdQ9BRZYSGTeBrsS3V+MSAQ0kABJlcW63b2HqM+8VG72pQW4SGA6uRs67y++fZabSeQpn1HkLrgNLZHdV+LGw7cpKs2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiPI1xqV; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiPI1xqV"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso53529126d6.3
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 22:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088549; x=1744693349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2OL/h5MecGrz6go7y1U0zeNfXujAsxg32wsyMhUhFc=;
        b=CiPI1xqV+vrF81dqMQPXhDClJu730xspIzFQ9gKH5zQ4hGhjEIuQFr+sJ3pa1r0Upz
         4kAHm+/cYCMynUifrnsTHF7OiHnwSDudIu+SW7fJHNiCemMBPSrp9wnoLPcztR7XlWKO
         RPoxAVKe+0thCJUE/hWvBXmchHvTHoYJqG88+p2zWLiZGwL+YASRYDspxTh/kvUhPI+z
         Que7Z3QIwz5//9g7LIlVaHV913v89Hbh1PxB9nBp1tNwGjM93SSZNJr6vkISvCT4sctX
         bEM09fnG8QJtMXFIckSIrydqBtvTiajvX/Dec6ScoU66syUZ91ZCBsYo4lh+AU7kgPuD
         LunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088549; x=1744693349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2OL/h5MecGrz6go7y1U0zeNfXujAsxg32wsyMhUhFc=;
        b=CuONtolBfOpDYDS0cEs37xTVigrRRdyCPbgNBr23wEpO2N7t5uSjPVN3gtBE+doTpy
         83EkNkloWbA/Tt665yt9ideH3bDVd6/3i5+wc8Vaulbdng9f99CTIFMpY9M+jTjOUgHl
         yMaeEQSdHY/ZGKsD7Cqbj3M6R+PqK11qLCCS5EnbUC4ghsifx9qi0OIHd/u8PD/OBz+M
         5lBEKjs7Z+Q0GRHbrJgPrhFiVmE32qUDk7lG38QqyxBu4PQWdbu4FVJmSL/lM/uNmYHl
         eOrijBeY+V15qOzf2/6BE65w+0CW1XE9ShF2eq5vXyHYfM5mV3bZ4aZ9d/JTtIfsG3w3
         dv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+YWDfdJMsS/ztKAJhc1+UVP8Wv3+nAtA2g0tTRMjjuq/FdYwtr29k22lScm2uKT271+CGha4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxirI0fKn2GeI8yYnjZvzf8FlXCEJtg5o8BSlQqbd327NlPYPaR
	me5qVqaUluebLqchdOm92WV4Ga2C+RJk3S4Pnt+b6kAHvl26PgVE
X-Gm-Gg: ASbGncuxMwOykHw/MpqPx3WQlkPr8PsMTiH7Q18VTK3++kX/AGdvL+XVq8R7fn7YcrZ
	WlV4V8NUg/PMNdlKOCHvBOxr+TpuxS79JzUe5H0xyXlSsB+ihd+M2Z3GWV5iexHlyVDnJJ92pdQ
	4+8ro/WBPf4MMJOz2aAz8cQMv+48fzq9smsSmVXnd9Nger/KTw32Lt8DF9byncw1PA64CMLeljm
	o6HL6iZErpTQJDWKCU8DScHa5Oi6uZEV34Q5yOzefF5zmy6R0cXkLnWcVTXQzr+5RZRu9r+dd6M
	fUiob35eaQMlwDe9mIxr
X-Google-Smtp-Source: AGHT+IFudylIoJX9TM2xVCYwLnDirGDkk1XJD5I5ishPdtU9+Tos+yJgYa7KNlWI0L6fX3868MmKCQ==
X-Received: by 2002:a05:6214:f63:b0:6ea:d629:f47d with SMTP id 6a1803df08f44-6f064b2888fmr249775806d6.44.1744088549391;
        Mon, 07 Apr 2025 22:02:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0efc128fsm69354356d6.23.2025.04.07.22.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
Date: Tue,  8 Apr 2025 13:01:42 +0800
Message-ID: <20250408050147.774987-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408050147.774987-1-inochiama@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, SG2044 also uses an external msi controller to provide
MSI interrupt for PCIe controllers. The difference between these
two msi controlling are summary as follows:

1. SG2044 acks the interrupt by writing 0, as on SG2042 by setting
   related bit.
2. SG2044 uses interrupt number mod 32 as msi message data, but
   SG2042 uses setting related bit.

Add support for the SG2044 msi controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/interrupt-controller/sophgo,sg2042-msi.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
index e1ffd55fa7bf..f6b8b1d92f79 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2042-msi
+    enum:
+      - sophgo,sg2042-msi
+      - sophgo,sg2044-msi
 
   reg:
     items:
-- 
2.49.0

