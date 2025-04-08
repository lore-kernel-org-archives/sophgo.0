Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812EA1B21AA
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 05:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088711; cv=none; b=FfroWvcmzu76lrE/UP6JBNcWo2gd379rXRS/p8GIxd5Iu/BHtBhSqccNgcj/yt+2a0qC46m8SOExAXVe6Jv6+EzmpP7Z9AY+vfalOMI2OW1IKXir60F3re48VIz/9VoASuLyUeQPfnL1GbE9UVCJFZHV6POTCTJIWVmmr4wPcJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088711; c=relaxed/simple;
	bh=r4sYCI3eGCFomhagjqBsfMEbGtkD0EgGMYSVpN8jcZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AENc9gpI0WBATXhrjtaXidX1/70u3eHLYnYqE0yEqRNyAKf/1y2TTPGy2HeH0VeZeAKzzgMSLomrYecB4RNcNCarSoWChfEsHQf7jthwd20V8IJT6xUZ/qhM0Ux6uN1Xw2mUAZmDE3jl0fwp9r4yB/fBy+D2wZNNG0K04/NtYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYMIyC/c; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYMIyC/c"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f94c2698so27114366d6.0
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088709; x=1744693509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hkLeiApJavmt3vffoFAIEtIa4orwTPaDg96MLZ0acMY=;
        b=cYMIyC/cETU+gbeI3PFdtAnrIDNB0GsDdPMD1+I7s4v05m7KywSylkrluT5E/3uVtt
         KABSNHIvKgvRrK3RsyZDpIiq8ImXVKNK63Hz/ZTC/0eQ3NFaVTTtym5zn/a92PtIJkHU
         nNmYSFg2GDTMILnY9gRcp34CVf763KJd7WTcLDpnKpuQFttjtAbCBdQLw+/qwJre51LE
         PjmGUTLwtFeMlSQGkNgfiffIXSHtRJDwSg7Ew30QcPCDEwOjCnkdwf4x2k20/RPJtk4j
         YHca2VBx2cPWa2nOHzKJ/jekV4Xw706PVgSuxNfTfSh3Yskp8r3UXKsYwbMToV5rQheu
         +nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088709; x=1744693509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkLeiApJavmt3vffoFAIEtIa4orwTPaDg96MLZ0acMY=;
        b=wGGoiKY67oV0JIHSh4ceeaB5KCm1cB+wM86QCJzgJ7Gu3qw7GPl807DOSgptdUIv16
         rUlYtnNC/OlzDbdwX8Bv+E/ikH2EwmurPx89/yEbOGLsSESRUZ+cl+o/0J3c4wm6CH10
         T5iOQr0CNd2tyFeeqtCK5Ha4rLgAYQwqY1vXX0UGJdwbkPxRQSbTR9pUSjEYlwRXiyAR
         eCADgUzZR+DsYGqOGVLfkkz6LfymGQCKfcp3gVGnwGzwiSAD8i8rM21CIUkylMrsuibX
         Ilfpnne9SYMHkVLhW0lfTCRx3Ynp+5tnXDg4n6KItLN4da0Ym4HVYSxhTGAk5MUZuO6Z
         1dCw==
X-Forwarded-Encrypted: i=1; AJvYcCUFftc8Q4rlNLF8VzCTQd4rjaoi/PXbg6a7NbuWXPL6aY4er/8w/sJsHtVzv6Uh3wNlvrLznss=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvtSBz3CFxpWPfJcANU/q624Ru/xITMt2CPGFdBfdYFQNxRtMO
	W9RnnyTusUzgqVGrlUSo3rxXioOCaU3gmHCeAloaRrqY32YMyFnX
X-Gm-Gg: ASbGncu8ZymryFkjjvhq5CH0UZymrg5wlBFzNzjgs2YP3waOGEU0JO29gcCZ9ohyxNx
	q+X99+63+GWmwJvjKSO2fARXR5dc1YEH3KBahzH3SKbO+fGgNUGcz8vjXimyg9l33mCwboPcxjL
	hxy6WpIMiemVFO4H+yI44KHKHgYMNyAjJ6//8UBD8KTK2lBI0bAPufdRlzsO48CGEwT2lqhrjRq
	5xDCVAe0Z47OlbFGtoPDw3zZWfAPkX6ENAVpN+rQuFYSXhrNZJyxehwukiqxt6MVvDgJuAOJ7sQ
	pQi2SHEYI5tXkxV2Mikc
X-Google-Smtp-Source: AGHT+IE/P5hOkSt+2na7U2vn2DvilUGNVGTLQZ4nZrqEyG305OPEIPkhMI2Sm9DlOvWaiHcJ6f2Gpw==
X-Received: by 2002:a05:6214:2404:b0:6e6:630c:71e8 with SMTP id 6a1803df08f44-6f0584a4671mr273573796d6.7.1744088709430;
        Mon, 07 Apr 2025 22:05:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f165350sm69164716d6.124.2025.04.07.22.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:05:08 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:04:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <53p3hkwof2kyd2wujz5phvyeu7g6z6gb67hjthmdo74jn3fghi@cgbxxrisuw5y>
References: <20250408050147.774987-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408050147.774987-1-inochiama@gmail.com>

On Tue, Apr 08, 2025 at 01:01:41PM +0800, Inochi Amaoto wrote:
> Like Sophgo SG2042, SG2044 also uses an external interrupt controller
> to handle MSI/MSI-X. It supports more interrupt and has a different
> msi message address mapping.
> 
> Changed from v2:
> 1. patch 1: separate from patch 2 of v2 for better reviewing
> 2. patch 2: separate from patch 2 of v2 for better reviewing
> 3. patch 3: apply Chen'tag
> 

This should be patch 2,3,4. I forgot the first is the binding.
Sorry for the misleading.

Thanks,
Inochi
