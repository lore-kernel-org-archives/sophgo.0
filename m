Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50E3368A7
	for <sophgo@lists.linux.dev>; Wed, 29 Jul 2026 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290149; cv=none; b=pkZ+RrYdHtUR8jRM8yNEP0SciEpQNR03jXZ3kB/LXU53ayj/fnweMoNbFbOqNfG+e7xL+PgAV7E30CtTLh7LQs/03sm272rbjH5jsVjDYmiv6elCd7E++lT8nGdJl/5DM6bCdhFhV/O7ZlH77pKqKTLfvHhVUqeXxpAuxgBhu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290149; c=relaxed/simple;
	bh=uNZvcbJs/pdC9ytN6jQCPgX4Z+OKYj6tcEv+kHCGMmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oUJ/H+1uiz8zobGFrOXf1/3+Z7+bpl1gY+sWx8uGVAjqhmmLEl4VOUO7N0LGAsA7oXZkzOZnrl1WfpYfIAgv1LSVHWr2F4QNUr5ZpP51xmD/AKBtB2/dHS/CrBEzUDmmmbty8Rlffk/PQU8TLXFXGX3IzmvF4DqoTlzprzhgcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvFcD47O; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvFcD47O"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381216921aaso400709a91.1
        for <sophgo@lists.linux.dev>; Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290146; x=1785894946; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7grHuSDIPRW8L8mo7e1hpwggYcsc7BeN7mOCkn3pJuU=;
        b=JvFcD47OJMruk153ox4htGTjwad7DuuJ2rp9JWr6Yaqhb0fqDyImzCEzXRqO6bEQTb
         DQXGmGM7YAZEOaMLwlygC3oQrxOqkYadhN/Hpgdey+m68xMKev2Xv0vnfIr3Y23Xqed+
         RsOSIEDozqb2aA9xKaQkRjiWbd0TUjWW6jvbE97bwF80QRGrhYCja94mAUs2ZyUsswH2
         CJN2VPTjfZwG6v4YPeBcri2KmBbqO18RQIseoFMRMLitCBXO6lcDU3QvvASfjE89Pikp
         K5TIZadcAi9IWhYdgoDpQCput4LuT/f09p0W2cNOmAYiqgzqwjH7UhNJshIkl3xp4Elz
         7DBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290146; x=1785894946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7grHuSDIPRW8L8mo7e1hpwggYcsc7BeN7mOCkn3pJuU=;
        b=bgWfyhAhmD5KS/DDdN2IfX/zPu10A247x9s6JCDL6vip7BmUEFEv+iLn9KPP0Tf1ba
         A3dCcJdAN+v6IfVbhE+FYlFuOe4mpUwdEOMgfJoy82Fu+DcoDschQYk6WNU2NixKdHan
         5tkrPMzBeTZIa0JdiYIq/3aS76LPw7XQiNodrD3oFJCL27UH5SbnqTuPfMNLdIWgKjLt
         Ef+fy/r6cEEDMv7Aa8TIoRvrVxU8GeD4Y3S1dEyakRpzacYD2sJh6zvgsNZAQbyBQUEs
         6vVJ9PKm4jSVZ0wKBi13zoAg1zFOOP2Fyq/skMID9MJ2r2TOU/BNsSF67twPIJPQ1ued
         oXfg==
X-Forwarded-Encrypted: i=1; AHgh+RrpgDScVf1mVzh3u9wnFOzXteueRI/sVfL2qpBLowGGK9KDXhRMq0LXYVn1XrK4ZEP5jznECZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJRMjsNnC9lDYBTjVZjXiwX5Asbs7V974Lteeb0X0ZbnlEPnCn
	+tuGOuMTR8PqHpBTgg6Kv/fOdR+A79W+nkczhcjc8ociQKsHmRRmELTe
X-Gm-Gg: AR+sD12IWt9iFpqizv6nZ8Y3UeTnYu+H55EpslGFHUHkBnTRqHKqbyUxRYHXG2cPdFZ
	PZDxtJX5sRKBeeiYyn311kA0Jhq+SRMhsR3X75DLPmsciGfj/5H5ZpyPTmBmzqulxUhyyO7nRum
	M3cF5XR0m2gIgpQId7tqKYg+76RkUVV9ylyv2wfPky+YpbdSRLRVtsX6TguG9YJ1vJzWEfUHdXX
	yWrR6J+QO8l9s+8aDaTLFJ5hyVSqBfblni2o2I5ZmuwHADdrzxWmMg3wG7gqgZDf8zFfGt915Qe
	exQipDY0gCeKn06Ns6bxeKnAhn8RfJyJ82oDZOIw/GzY+wbjPGoMGeK6lV+P+eX//OEezOWbg2U
	wLriE3jEZ9cbYfCIoqSInLVpDCO7r+R+6mx0BpU5MTEerNLGvPCuIOAXFDvkenzPHyQREs70olg
	rE0FRzeYmHe9lrGKoRmuMenLcEEMyfA5fuJaXo6fdvTNKhInOLha6ad0kxy/VnF9ojgvTJJA==
X-Received: by 2002:a17:90b:3b41:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-38f6a30c840mr4956125a91.5.1785290146311;
        Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642dd6casm1984373a91.13.2026.07.28.18.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com,
	Alexander Sverdlin <alex@sverdlin.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Wed, 29 Jul 2026 09:54:59 +0800
Message-ID: <178529008850.164571.1818758565125739771.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Jun 2026 08:03:21 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking
> from ethernet, enumerate the wifi chip, have bluetooth, and can
> read a I2C slave device over i2c4.
> 
> [...]

Applied to dt/riscv, thanks!

[2/3] riscv64: dts: sophgo: add SG2000 dtsi
      https://github.com/sophgo/linux/commit/022d1bd8b08257966c4a00fc21fb72a828bca870
[3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
      https://github.com/sophgo/linux/commit/0cef4f813649eb19476c98f763128561f5bdf969

Thanks,
Inochi

