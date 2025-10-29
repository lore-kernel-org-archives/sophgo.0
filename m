Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC121D5CC7
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696705; cv=none; b=uG8GYaireTe9n+AXdxs8ARcDjGFV+HGutVXGAM9YWo0fZS3q7M7WkoWjBAvQURssQuMTqk5lLsnrfHnzjPzQqYRZwwYcQt7Te34mHZRvwyhKrenbIvps3R1ceGrhpRSwKl7w8mIyOAQuG+DR91dCj7SZe96IeORJHx3MVg7X9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696705; c=relaxed/simple;
	bh=hQaWYt1xUWiQ0PHspTzHNXsFJ52ZXbLRgfq1RinfZs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+4wJl8TOm4cEGOvCzuwkIFcDIs5wtZCZazVVDknzC/QAGcFHdihiiKC+vTPvZDmNJNc/X+tiB8veZJUHxs1yEs5F6KjpzbvR0eF1BEsdqTBLOBrRg65jXAsHXvrfTwNmwAu8I9A8p5vsPqHLYpEyjAUKzZyXmOg2z9B5cdnSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYjL5U2b; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYjL5U2b"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-78f30dac856so75115726d6.2
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696703; x=1762301503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xT2Rb2PqwexlMD3Y7gKJkUff1N1w8n3j13bjOXJoVA=;
        b=IYjL5U2bVjje1F3FV5svSRZ2QHQ64DlHhsQvu1zSUR8YYkoGyPDrcy2EeX3BPIu4tH
         wLyAqPyzEQ9z9bVK+SUWvQBc/Pn3Xs9pSCyoSzTWVKCgG/fDyfUjyyWx+xo3+PAFf8FD
         qN3Eg/iodWQcHky0xWR+WMO9ZsHBWsNpIXFPcwZX4lhoXledpK1c4sixeGYS8Vb9R0dm
         p5B9zItdD+cS/3UwADyYh+5QQQi1WxUXHLuFykMFfs3KhxajMGeyyCyI2Ur26rRza39E
         Kho2OXtHUGkn6D/GyjeGkmd6hIg57R57W1gIACFiSqBG3MIKfFU+Fbq/uEDDVGZd5771
         J8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696703; x=1762301503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xT2Rb2PqwexlMD3Y7gKJkUff1N1w8n3j13bjOXJoVA=;
        b=C2+FLg/SqvyXRLKBwiKTEyuLw9sCMQUF0vEhh4le4PpS1BnJq4kQwuVlQ+Mw9DTiGz
         3DEKFVG0mGXzARwptkVMICNPRGHIjFT3FFvFucRhsqdc9PdizwoQkvIf3bYTc+J0qEU6
         EoJcHb2UIF2ETQLAcx+X2TAGIi/UgjuNJDJXYGCfPLa+7JDT+r7Fyl+2h5pC9/kpGJ7B
         OJCcPr+ASMD3DVA6WioYJuhuyLyQuhE0KAvbHc5dQHhfw/xsGjHzDJVEudXntxnI2qEx
         SLYl3I/MZwxV5P6ag9P+cuyoFSzU2qwNpWhyAs09Ik02pIykhZfllBJdQ79m5UNlhqhp
         sxng==
X-Forwarded-Encrypted: i=1; AJvYcCXmbfXqe1syNDO1PyYPHhgI4uR2XjrhF+Pth0mX3T4PUAO0t76C3/EqLbRrlNvslPdWOFpNXMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl23oPAt2DbfU7kpgMfYSPSC60c84DF0PxJcfD8hmFquTUPivF
	BfwGaj8ltF/7oT6awcx34rp7ICrrQfxIVMULBqaleTmxaYJCKgJE2G6Z
X-Gm-Gg: ASbGncuGMKauBe8USRFciHEnsRrqIXlUuRVGc7Oazz23J32qVO2VArIduVgRcWaBzCc
	14qbDZd5Bnr8EJcBeW0+YB0ZEja/waVcsIfP/mqeWWDHfLZWDHoKP7lKxXXauNjKk6LJp6+uUBZ
	QEe4gnhBR2tzpLWugz3StGnmWXJmSApqFYewkJ89L8lA4QrtvmGR/P/+4rZhdaBd6u0CVHXC+NC
	W+Xz+WWUsxR1EVNetztlUi2k8hyi3IvvroT+TyZGXO8TVStCruWwOhoqRqJU390xxOcYq2l7+d8
	GV5EsolB/8lIdkGTKKZhoHBYcnP3elSPPgsfit8n32uHagjH5yeajHwYDBkGEFuX0kdGtiYS0mx
	DP++c5hWtyOYpjWZvdmNLiNWF+PMq57i9BGAI9AYzUCCmfis5E6LrYuZnmlFnbm7VjeAId2njaw
	W5oK6NHmKju6CFEIjP2T4rjqf3aTYmEbJXng==
X-Google-Smtp-Source: AGHT+IE4SQO4yCAzGuZzWxWUxkwVcez+Sp+Ibm3DoBI0g5gxVw79H8XGehLNVKd2c7qV1ykgdkqPSQ==
X-Received: by 2002:a05:6214:c85:b0:7d6:c615:ecd1 with SMTP id 6a1803df08f44-88009c12eaemr14080336d6.61.1761696702575;
        Tue, 28 Oct 2025 17:11:42 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:42 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Tue, 28 Oct 2025 20:10:48 -0400
Message-ID: <20251029001052.36774-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC [2].

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.51.1

