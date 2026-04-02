Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74333E1CE4
	for <sophgo@lists.linux.dev>; Thu,  2 Apr 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132104; cv=none; b=D0YxHNMU9JQlXRQiVXAM31bejVDFl0wG10EKNyOL9oOSO+lSpth07609h4kIsKANNAfq2jDKRUkYqSH3l3dAX3IL9ABWbO5BtEGuCT1YQRIJL2Sga9Nspes4orSf9/57Xl1ONKjSqGC8dSeLUN14xc+PuopZLMdvRfLJuE288tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132104; c=relaxed/simple;
	bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7pHAUDSbf8wzyaxc1Gt6BfWf2+qYrKk/eCIjw4604mwyJlozE4bbdDPA0AgDaip049XCmA6MXRxt528LtAY8rIa6AJqdEw6ecYNbz74SuQVCl1ehw1iSiyiwcDGrPvVzGuWEYo8JfgVcU621sTDezYfxWfu7wMEJbwccFlo3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQYCuI3b; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQYCuI3b"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50b3488fb31so29060861cf.1
        for <sophgo@lists.linux.dev>; Thu, 02 Apr 2026 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132099; x=1775736899; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
        b=aQYCuI3b33aaYKxvnOEFAOe0kuQpU8ockkqcNPAKSJIGhW4ylsOntEU/yX/q9+1X19
         kkvqeVU/Z5wJEQky8g71/tZUdbCNH8afoB12ZjhtO+TN3fra3686kUJdwfNB8G2Yd8SY
         qj7o9dVLUPanAH30ptrWTQFj1rd02S8P+GzzFyCNTvY0THGh7K4xzkW5R4XV4fNC2iwU
         9za5NfEaCtCNWDUv0swD2W5g/DoXRi61Vb1rg3CubVdn4J9XB/5gb5MkEwctmQCalTPH
         mhVMCgZiXcRwXo0MwDwH/sC6WLEHCJlmfQgLdc69XMRvbQMmvWFtt5jaCUQjTigM0Ivk
         nCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132099; x=1775736899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
        b=r/XLQmjjpW+IV0EwbVLFpy/A/0Nmjoqo0OVBBFwpz0G/JusULHSGZNudu4cuimLtpn
         ijSdH0dRZLv+pAjkHWnPuMZTi6zc/8MBGQ4SoOTLemCBwDTTv0OYJOxMAhhwN53oaYRx
         GflD7+pbPbCowcoumEXoNw6jTx6KC0l+vgn/4gqFSx7uHU7eq4n+eHHRFU/O/WsNZZRq
         37FWy6M8A2igrZGBqYJKLlWnOsbMDhbOfjl75i7ctZM0eaI9SKD7/NcvQWI0GZgG92Wf
         Pz4lwzzNXcVhctfr12BgPtUuY3qNcQ205KBKMmnHklmxTtbAw0xvNXHKJhugSd7PmdQ/
         eLtg==
X-Forwarded-Encrypted: i=1; AJvYcCWR55mO7WgAcc3tHIvBnK6J9YngRcJaPgSzuQiDOFlSbmgMOKSkXLXPmngj0kUFLb1XCdCHg3E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBlbEskyHjcfwznYyWGl0wNFHIKaf1mXUmV6xPxKpWt9tAArD6
	yDm1AmE1DuWjN456PcMwQ1BlEe3kYa5XnjMSDBpjwBFQuNLjstLIxb/z
X-Gm-Gg: ATEYQzzDUWlzKiTrmosAvTKPsq+WUKaYjKWXIkllJ6qxtLXyHVhVsT3FnRfkDXLPINm
	XKGB7c3OaOMFFXiQlMBjB4B7UoUasSlGvzyt2VpKM8m4q+1SpKaOo7FJ/9pzagFfg+QNXoJdXgU
	hn+WstlO9Fw7+0btWqCD2w3gV0uJy7KjbldjZGRAzcGTkljCm0BDyG57Tfz9kSMxEOnG7bvTVop
	Zdu6AMtc4Jq0Gd19Dmjam5JGvmIMToNnYMuhNxEge5qJ3SGmo595nXTRUR/hZk+AczhloW3Gx7s
	qdSdx1fT7t3ASp24hCVmiwUZ/XTAY6UDlaEjAoejIDxjXC0mZYm/c2ChiSUR+HDW78bg4v7ZLDp
	7dg3N+ZYDP0Fsxgp1Q3/O7k8yzUKERlNvEMvWQSNjzAR/oJERaa3dhI4bSgo/9LovxKunY2eUUq
	RrkftLQmu6ps5w/8oNKCo1PnDvzc0oeUj7i4dq//jpaJok0Y6sMd3LFtqE
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr23690271cf.6.1775132098611;
        Thu, 02 Apr 2026 05:14:58 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1d871csm23904961cf.10.2026.04.02.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:14:57 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:14:54 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com
Subject: Re: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S
 board support
Message-ID: <ac5dvp9-pvIwguAA@sleek>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <20260328173450.219664-3-josh.milas@gmail.com>
 <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>

Hi Michael,

Just fixed in my latest set and will post v5 after debugging your eth0 issue.

Thanks,
- Joshua Milas
