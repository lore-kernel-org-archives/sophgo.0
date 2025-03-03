Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119D1F8BC0
	for <sophgo@lists.linux.dev>; Mon,  3 Mar 2025 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000641; cv=none; b=qosY4CCINCX92Sp/DI6hOKtFpXplwp7rNrRq8pvdXICwhFZyWXuxN/Ju72AdaBW1Umj4LQfrf1yi+Eucz/aXuc1fDYZxtIYGDFJIc9FxqjJVw021FGGmTxnq5ulL6pcm/LcUom/iVUdd4vzyTQBZAugtGEcIB7eLKgT2Mz4+DAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000641; c=relaxed/simple;
	bh=Jqe8Y5KSRz+van0BhEQNwElHuoSXwhP7NXBrkvhu+5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlFrfkSfd2YSiIknuKO8Fk2UK4dWpOaE7RPN0h4Va99JYsdbr94DZzfJsx+SGB96TSPZUGIEeet4AY4t+IVyas/LvG4C9/wcFn3NeaRsFxKB/I89rUsKjvQl7bjcRaLrNQeDzrAZHQefqRFcg5zLcFjKLAW8iVRSCYCgGXzGt/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrSfMBhX; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrSfMBhX"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0bb7328fbso491900185a.2
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 03:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741000639; x=1741605439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cac9SGeYgxlf0ZE2MBOLXGNfNfGSnO8PvB/fPnkfcsk=;
        b=JrSfMBhX4ZCjvvdLhf1M77CRXQS2+7eoz5MBHX4YExWQaQMobzhvrZp1Xv07EAwU5u
         R+TlP0TvFy1k9/ddQrLDLbma/qY+TFMTyCw5KDkCuOeghclqUji3TWJYgl1R0NPkYz6X
         pxjSjjXGQPM8Ga81x4MgMzbbO16h07bvwZcV/h6cj+pAtXmgl7XMl6OXmtcKUfl1I02+
         olJiJK2mLJiCowPrH69csQpf96SlwfkO7YLLUxC2nZF+1618lmmGSvO00kFxyJiiGu2o
         prAD5wMFFeAm3BHB/yXIsxTw4I//t9LMuukdPEzAkBverKOLfVrkjOkuLA5ie3rXm6YU
         gnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000639; x=1741605439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cac9SGeYgxlf0ZE2MBOLXGNfNfGSnO8PvB/fPnkfcsk=;
        b=axlg5PhEKE46XEBqf5cVY4U4yol4dJ6C4XfT+BCqobOVckHf0KQRY2nYG2nR9Tn8Li
         g7R0s9u0xgrjN/gCn4LozByzVaDbev3dXXvyr9nEMjAEmzddO8Vrw/OafKfbJI4jO+YC
         fDauSW7Oayj7f3Q5f9jc8351pkNkLZARMJFHwyPVzu4+p3tkwlJPy88S4xHSX3MLlF5w
         0WmYj7x6NGarL0FlNldZ5NBXGB0hRffVLxlPWTD7Nrken1JWUV6MgdUzUxslMuT61Al5
         K17dZcocI6CCTwDRLt1rtkaQfeETYSAvXLomcBiX3jM6CXAGXJbBfGDNRrUzsKbhqhcx
         jwCw==
X-Forwarded-Encrypted: i=1; AJvYcCX4w/ZIwdlN1HGsu232urzqsdElinYVnyVMGw4VrFrdEhGHkmucPPZpTXYK8HT4aJ9KMAQVzOo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpZ9CkQNiXX3nZyuuQidpqBEGcsi5Sjsl5ZVFd7z1lg+MrfjGW
	gsIz+jLUIvbcJ15N3VpXZjgqrwTza+rGFAc68uNg/7q3ppadOSm7
X-Gm-Gg: ASbGncumSIhcJDolyKJEIz9qoc5a6RUCI9TV90Ss/I1NevPgSgSx8joz7nHAH+y6yek
	rBfo/iAKpuYW7jiF/58jJ+zo4GcDPSHy7ELWcVRiyYx97kL7XGopvGuDi/1M3n0r8sf9JgwrPR7
	cGOQI49IGF8Ld0iR7huslIg7sK5TN08VvvykszYqRHfGodEf1NbIa06Qlgetcq28RVOS2YW7Hnk
	3dyNoxxiDmkqMK3LkWrKugmQbSDTHteTS8o3+1wZsXbv+gs4rZFJUXxOIm48TXuDBEqBdWzN2PY
	VtVsNtZGxAZNeoXlT3Ax
X-Google-Smtp-Source: AGHT+IGeFdXvURQ7vI0EQuXxHZtwK5gbsycOL767I0CGGnL7OmQ9+5cFegMcJb3QiTypWujcAD+s4g==
X-Received: by 2002:a05:620a:1aa8:b0:7c0:b0ce:a577 with SMTP id af79cd13be357-7c39c4cd3f4mr2211231885a.25.1741000639324;
        Mon, 03 Mar 2025 03:17:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e897653722sm52123386d6.36.2025.03.03.03.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:17:19 -0800 (PST)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
Date: Mon,  3 Mar 2025 19:16:46 +0800
Message-ID: <20250303111648.1337543-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303111648.1337543-1-inochiama@gmail.com>
References: <20250303111648.1337543-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, SG2044 uses a similar msi controller to provide MSI
interrupt for PCIe controllers.

Add support for the SG2044 msi controller

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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

