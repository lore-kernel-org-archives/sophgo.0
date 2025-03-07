Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196A136352
	for <sophgo@lists.linux.dev>; Fri,  7 Mar 2025 01:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309621; cv=none; b=l2wXSvExrvS2Ad4kbnkenPUNpOweAOAee2wx+JZvao7CusXCiSFGaUES1vwBUik6uLg+xhKjynKnPeUPAJO0kCjeRT9hFMUVao/GqtiUbKhTgkOMg7FGzl2PlyH09HwROJgaNqJtbJo0oKjrnng4mMWeNaABfj5N2ycyy8YOm9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309621; c=relaxed/simple;
	bh=aEqSvb3bhI5gUhZW2nPCKYFhqATFoI+W/DdltbIlaqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVtB9TU7HYUTZeSmMA96jSfZsretjj9CfwnTbDBDymfSbeAz/FOMGGX+n4SFibMLRvhdZ3pnwNFm321MtSqmuy6Akl+5FYFGOsDpW0VH1egYRzBXm7TafFJj42JoFI1ljARC2tvaxT3SEbgtJuzmBROVPSCxLkI0wt6Ib1QZ4Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9oLRNvo; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9oLRNvo"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f8657f29so8636736d6.3
        for <sophgo@lists.linux.dev>; Thu, 06 Mar 2025 17:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741309619; x=1741914419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyywHQPXcyfHqDiD+G22vJ+bxldrNlq8Ec4J0npD+7I=;
        b=d9oLRNvou7BpuxPXf9QsccbrWG0LXrn+F67S3MwQhRImKUCQPLiRBb3xZsjrmVF65i
         7GPV1BkG5MByCMJ6C6fGPX+T1n1e9v3wPHYmgyC8tFZw3rw2NEMEs+/MAufPNCQ+9V9J
         ZNEKfcECuf8os5UmEKPsJxbFuQWG0tz3RtIk4hkQ1CqsVBpLexf6n4VJwvK0+jhuOY9L
         CIKoPVADD1JWfkq7MeF5P4NRR2gVjEeTKhZfc4X2yo5PUrRvU8rC+ADt/i57dDwZ6kvC
         j9+fsBXrnSD7mJJ+Xvy6Yze+8LjxDuTlpQbjDKvp5yDBw7wpcI85WYnmdFT3sS9o/g/U
         dwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309619; x=1741914419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyywHQPXcyfHqDiD+G22vJ+bxldrNlq8Ec4J0npD+7I=;
        b=Rked8HhmmKZL85x817NRtvLGvlbi8D0GsM/+tx/Ca05rzl2lK0ySCYK80/AX8kiO+W
         X51gTeGVMyODF69mDdDZH+W438GxcJWchTqx/EB3dsrOSBXibyNMVSWZvNBDZEQoU5Ql
         ctp/rboEUyiv4C5OeNROLBQOmoBqvbW2V0M2ymSXYWkQ2sSp6PN7jP9hT7Mg+4nLO+bz
         fiCf+7BC7HeE78fUVhOnSefxhcPk6kf3o8jjS0kHDZiHhw5NWwaWXlwT3XyKlJX+2yRP
         wPaT5l9BhINbkASCtcgbd+vS1Nf6ZkzorOYRkg8LrxnVHFdXJeTTreY/mIi/sYZYDtPO
         ayUw==
X-Forwarded-Encrypted: i=1; AJvYcCXfWICi6MU70kABs6Xn7uSIHozlISz0ZYMqdARWE3Hotv/Iw3I2YaelQILCG6BBpWkuYVd9tuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHT3PH9jKCSq+2BcaakxCgqT2E2coda8S8mwIcuEsylP67nRl3
	Jx8UzJipp0ghUmyWrTMu5U1/lTlRnsuxQ2eu32KdgkGTArYnZh6g
X-Gm-Gg: ASbGncuE2TMzRJ7QBCMhttHxq8ANB2tHlGklzRXVvUEc+vHuXpxz1LLxeYAPxNUYhuB
	s2GhRGUrdm2SPdHVu8ENfV1CCgf/eQZ8QmrKGbBklL8Mw6OdtwhxVmH3YEjsiB6xx9dAfAfxlcO
	bVJwqpP7a1KWepcBtOF76bVv3kKJFmjqG+Yy4YKqvj5k2fEC/ixxm5atTaIwDgDCdeQE67tCxiM
	alOjQDSMgmnCxHjp2jw3noacrmUcmT+OwU6ubPFUIaL5cziLWIXhcAzXPXPPp3RkKKLc2EZyBrW
	BBroC73l4BHbIWqWkoRE
X-Google-Smtp-Source: AGHT+IGyisWh9R/IV05ZBzDHIWTnlM5I9fN/HL5vjDHLVRhtDEa6+NOTsTOLeiyN/jflRKwmjvzg9A==
X-Received: by 2002:a05:6214:230b:b0:6e8:9321:87cd with SMTP id 6a1803df08f44-6e9006cbb95mr14545556d6.40.1741309618743;
        Thu, 06 Mar 2025 17:06:58 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8f70a4495sm13271196d6.52.2025.03.06.17.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:06:57 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
Date: Fri,  7 Mar 2025 09:06:46 +0800
Message-ID: <20250307010649.422359-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307010649.422359-1-inochiama@gmail.com>
References: <20250307010649.422359-1-inochiama@gmail.com>
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
2.48.1

