Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B562D1ACEDE
	for <sophgo@lists.linux.dev>; Tue, 13 Jan 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290381; cv=none; b=DuaNouS6/bQkxu7DZoRSSU2WMfQ1kInA8JE9LXhsKw/hnQ9iO0TZSDhr2tKINo8iogjItwZylk9ZOdZ+ux2n1pFlRi2yOgYKVpD7keonf7pvBf8xeEdzURrbXkrG6jVlZaw4PW5N52WH6K6+gxNFgMjPk+a8DhUArJ2d+SrKmPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290381; c=relaxed/simple;
	bh=wimpNbGQyk9u8e5Qt5gFXUuJ3GuTlbtVqW9EiDOWvHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpDhDxGhOh1CSKax5kenLLURZ/uAFXKgtI9uPoZdkZTz3aVxHX7pHP/E5lTAwvslwn/Q47JPnprzABSoyd3vMkVk64Hr+rZUOQH2wGPCpF3wuY5OA0C4o8Z5BwaIOYya/l196cG6waPZpdZXK/pvKl0UMnf+hk+pLh7F/BNlC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DM1vLJ0R; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DM1vLJ0R"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a0834769f0so50224085ad.2
        for <sophgo@lists.linux.dev>; Mon, 12 Jan 2026 23:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290379; x=1768895179; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=DM1vLJ0RsQ1m58KH5Q570UNN49xePEL3fHV5Ih531xg/ToukukrHMt+K8Gp7LH2T4k
         TuEU8BgmayYFWa3rIOcYHGJGxQihqa8nTeIeI6sK5u/3ZWx1mczuFlTjq46VWUIhogXs
         MtRQSMr23sJ+eRcnyv0h+sNXv0X8Xf5EkvHiRDqGRVpk90PEEOGyyQTzuXDFnbaN4iHf
         7wgJFS8IRQZ2r0mmhOEjr39v70EfKojRlpcxuNb15EVfUM/00hKEALRII6MWbuZUOKur
         SPScFGpUEMrIPQDbcAohhx/TAYvH2CvNPFMn8mgXY8ZZ2M6392YLhc5XXWSsbPpyjv1F
         bkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290379; x=1768895179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=b6IpUBV/LzVbZJe61c+w8m9eERyG0g7gaXV+SOjTVq0BGl+1iTvs6CK6tKM21qlE0Y
         Ic4amB7gFhMw8FCESIAqQCdOS0dGN9ZYEjMS43b0WxmJYeV0gQWD+zuGO6jLHfHalI9B
         IcTDeYrfdY/oWe9+sTxKDcuMIUrm8lY6bUe7Sw8o8Fu3n3aeTIXcN1d3/kiGAy/e+tIB
         jROyqU9Pz1xjZjzU9eL+P2P7dDPw21b06VmktJnllUBeErcuFRPorPVYUJhADakdCW4y
         g9GYn23agfigV+B/x9pvmMMv/vFwX5r565QJZ1Ackmx+3Sy8pwkl40pmIuAj+aCVm8tv
         SYrw==
X-Forwarded-Encrypted: i=1; AJvYcCVa6Nf4XnGjHfNiS6askZKto8qCJH9QWY4+u0ulu/zplB7geVU2MFJM+hkN62Na8lD6KPFlVPk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0I4Xf3N+y7uwHX+kuYpmMAz2jWlWg75jGzqpsy81boV3OAEi3
	RRuUB4Uo5rTFNQhuiF44ffo3RXqLJtDTMh9sBWAZnGBQ0Cppx/ttcTF9v5pMt2gbyf4=
X-Gm-Gg: AY/fxX5MsIA3BNSNVFPFNYD9SZGj8HzcXJRDOpJYwXOIGvIsAuZO+Y7CYjPG5VzJHys
	HSGh7ZwH6eJQBCJOhsUwivxXRwwZGNeZixsep7mMTNU8EXBZQwZiQoSaMFROYPHc+D5vYsE53js
	nL/InUTPekxoAImVq6rXJW5GUq1JvnunmgRQ11GyISOA4Ip6QogGic7T5e+0krtk+a/g30TKxQc
	6nD/SWRVJMOePcz0g9vxJoFldtpkC8u8gUOIZY4TACmvRvAkcBGft7wugo+lw25lwn8gioD1IIb
	MdloCnegofTCi781K0Rv6K4a+SeI5UAUQHPgbf7ky8ZtfRc2N4/3V51oc8w4Ne3907qNA4VhdJv
	3/EmOnIBcwhgahCuO5VJaQkT2/yhTQ0NT/zrAQJnnJfBFO+LREejLKi6PInrxSSyFlDdRGg5F88
	HvF/bjWk2elroQjvZBBAJL1J1gPPJCkC+O+bbVY8Hqutd3TycxwkHv0poZsWODb2/5
X-Google-Smtp-Source: AGHT+IGrssuTQycrsW+2hCknhmQdMnpg0esEoKPvLFi/81f/ttHiYeTe2gILmVWkDFy41Vy2Qxe06w==
X-Received: by 2002:a17:902:f547:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3ee48ff6cmr185468915ad.35.1768290378939;
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 15:45:53 +0800
Subject: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
In-Reply-To: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34ed5057e3e79ad61311f94b7dd404..0c5299e007622a123d64cfd36ac1491b22d4255b 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -7,7 +7,9 @@ ISA string ordering in /proc/cpuinfo
 ------------------------------------
 
 The canonical order of ISA extension names in the ISA string is defined in
-chapter 27 of the unprivileged specification.
+Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+(Document Version 20191213).
+
 The specification uses vague wording, such as should, when it comes to ordering,
 so for our purposes the following rules apply:
 

-- 
2.43.0

