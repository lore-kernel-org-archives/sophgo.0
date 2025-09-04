Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150A2B9A7
	for <sophgo@lists.linux.dev>; Thu,  4 Sep 2025 03:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954849; cv=none; b=TvukEbk5eq+1mZk3IAwIuR2z60UYMgya3vn5AY/KmIvNd2wUqPl+lgmZMyVfanBjmSfB4hHViZfBxkUE33bQbdHkPJ/gs7SB65Bx9Dq1r4zQfFc78hfLqVEblAHKpOCo2OCsrbdQULY1aGMvEllYgMcAI5WSIU6tbJAF6v7KMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954849; c=relaxed/simple;
	bh=fJXcIelCzSQ4ncGEXNsg2zBinjQG6alr/a+lwsBakRA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XYCP9LNgAAao066/NRX3bJYwes35GGUuFydpLxWwtFm60jk0nJnFjWSVZzmAs4awq6VOtAOVw+WItCYRgGbqtSHEpDauAPSQsNkiKSPGhqMV2A4YrqMpL9kUFfQqYc39sqEIL49/dW99zP9oCt60rTV3+54GfvGlOIK1EiVW5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChpTHBPa; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChpTHBPa"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-315c0bc5a8cso161548fac.3
        for <sophgo@lists.linux.dev>; Wed, 03 Sep 2025 20:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954847; x=1757559647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5jXeT55BnpUVCszwTrOGZ3L+gWKoVejeqfq+IifiGA=;
        b=ChpTHBPabOTC2IPzobO3mQ3IwlNmoWC+T9yn3gAnVX8PvKyFyww6iuQ0OtWinwp6yJ
         n8O8nZ/K1EZUTAbwDjCfW8eat8ZKc7AffjM/shOVCHNPcQ1NdLgMuF1JdmzEbiFZdTUH
         BdWFuq07ttIdpZ7VKYuvmoshYp7dl9rVWQsPuvBa0vToTWtoOT7mKa/6zsrk+W8nKC8K
         DN8zHp358K04BdD+HqBl0UFl8ImMIzMU3VcOS3bFDxK87llDA+aOzf+8N5/Rtn/0Vd7v
         Ct7ngKINrlKtIlpgZ+xqb0JPxr+EZiwvE+3KBxhpEMEMV5Hsf2PQs3RHmnCbBuIHq1kr
         OK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954847; x=1757559647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5jXeT55BnpUVCszwTrOGZ3L+gWKoVejeqfq+IifiGA=;
        b=ihB3+eadN5r+Tv458uDEX2kP3Ewu6veaRNT+mzpEr+67UybLha/7iOO6eVYkZan0Ci
         kP49W5oJ+LTeqv+VBscdN4Xmg3icCyZDSrz8iGBbDT5ke5T1NXqDaZV3Cwb7AjPuCqAx
         akJu5VR6R7hZchTG3B5Q11V6E5F+9meJDUlyVJftStD+lhpj/87rd3B9/SKpo2gpSD44
         Rh1a8Qp05+cYr5U/QIoi5aYTkvClvxoZSZlKz3X8K+tJt0/zjGHiRITH2XgfAsgjcRGT
         vdb5UzldMR0mFr9Fyn6SlA/OMBzKYDDa55pt719y8cnsqMJNr5Qo1vjvveDylptwv8Gp
         w10A==
X-Forwarded-Encrypted: i=1; AJvYcCVJiymgIczcgZqpEUUcX8veG0n9w5LVAbYpi42W3Pa5P+rFUbhXlvcYjgIDUiAW0LDvH8lhp3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTlIzuMpI2jzww73DuVAzLhIyTORiW4ljDYYhofQVOiQ9bMeaJ
	u4AtUweVqVqqYUg7bgdumVWSKdb7pewQ+UdnysCvDSvNiYvNXgvbSYhD
X-Gm-Gg: ASbGncv2p1I48n/aqetOlVcyJltYvZDKvv69aGWML19M2t/vY+bEoQOUd7ZoiTjPzYA
	298aN6y4mctjNnCsi83X4Tz/pRo2wCscQAUO/Otjr0YAGkvwXYNl2hO1r0I6z4c6NFiT5r0yr4B
	8vz0NilNH9PIk58pqxB+1cdHAOQGVJU79NPaBuNEelL+3ABpJ0KQTmTQy6EdeMmYW4RmKaYnVFu
	MQfER9PX09ts5Hw7ScLzX8+VGpTr4PLC57YUKrhsLq/9MdAK6eIeUBXTPc7ck2/mco2/kAU9wop
	kVMOXkdzpVmCuyMtHn193mqX4IlENwCV8QPjwoxIJE+//bJrNNTFHYTSPBqecCBgugoAY0hIwgt
	aKf4XqYqnoniuyJ4Af1fv4tP/q/VyFKVwLCLsjRFcvZM=
X-Google-Smtp-Source: AGHT+IHlvmexbbW2CBYnIgaBbF+B/QOgH7eG7bUDWUjPCiy5DLQ8QKw4zT3k8FX/kgF+W7r/JPofcg==
X-Received: by 2002:a05:6870:63aa:b0:30b:7ffc:ee85 with SMTP id 586e51a60fabf-319631d13f0mr8794231fac.21.1756954846566;
        Wed, 03 Sep 2025 20:00:46 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7457428c153sm2570265a34.8.2025.09.03.20.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:00:45 -0700 (PDT)
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
Subject: [PATCH v3 1/3] riscv: sophgo: dts: sg2042: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Thu,  4 Sep 2025 11:00:37 +0800
Message-Id: <831c1b650c575380d56ef3e2faed9bee278c9006.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756953919.git.unicorn_wang@outlook.com>
References: <cover.1756953919.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Fixed msi irq type to be the correct type, although this
field is not used.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..6430c6e25c00 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -190,7 +190,7 @@ msi: msi-controller@7030010304 {
 			reg-names = "clr", "doorbell";
 			msi-controller;
 			#msi-cells = <0>;
-			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
 		};
 
 		rpgate: clock-controller@7030010368 {
-- 
2.34.1

